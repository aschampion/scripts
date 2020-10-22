#!/usr/bin/env python

import argparse
import re
import subprocess
import sys


def inclusive_intervals(start, end, step):
    a = start
    b = min(start + step - 1, end)
    while a <= end:
        yield a, b
        a = b + 1
        b = min(a + step - 1, end)

JID_REGEX = re.compile("Your (job|job-array) (?P<jid>\d+)[\.\s]")

def submit_job(qsub_args, hold_jids, command):
    base_command = ['qsub', '-j', 'y', '-b', 'y']
    base_command += qsub_args
    if hold_jids is not None:
        base_command += ['-hold_jid', ','.join(hold_jids)]
    base_command += command
    print(base_command)
    qsub_out = subprocess.check_output(base_command)
    jid_match = re.match(JID_REGEX, qsub_out)
    print(qsub_out)

    if not jid_match:
        return None

    return jid_match.group('jid')


if __name__ == "__main__":

    parser = argparse.ArgumentParser(description="submit sequentially dependent, held job batches to SGE")
    parser.add_argument('start', type=int)
    parser.add_argument('end', type=int)
    parser.add_argument('batch_size', type=int)
    parser.add_argument('--initial_jid', default=None)
    parser.add_argument('command', nargs=argparse.REMAINDER)

    args = parser.parse_args(sys.argv[1:])

    command = args.command
    jids = args.initial_jid

    for a, b in inclusive_intervals(args.start, args.end, args.batch_size):
        next_jids = []

        # SGE will not dispatch task ID 0, so do it separately.
        if a == 0:
            # Cannot set this with `qsub -v SGE_TASK_ID=0` because SGE will overwrite it with undefined.
            single_jid = submit_job([], jids, ['setenv', 'SGE_TASK_ID', '0', '&&'] + command)
            next_jids.append(single_jid)
            a += 1

        if a == b:
            continue

        batch_jid = submit_job(['-t', '%i-%s' % (a, b)], jids, command)
        next_jids.append(batch_jid)

        if any([j is None for j in next_jids]):
            print("Job ID not found. Not dispatching any more batches.")
            break

        jids = next_jids
