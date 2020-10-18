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

if __name__ == "__main__":

    parser = argparse.ArgumentParser(description="submit sequentially dependent, held job batches to SGE")
    parser.add_argument('start', type=int)
    parser.add_argument('end', type=int)
    parser.add_argument('batch_size', type=int)
    parser.add_argument('--initial_jid', default=None)
    parser.add_argument('command', nargs=argparse.REMAINDER)

    args = parser.parse_args(sys.argv[1:])

    command = args.command
    jid = args.initial_jid

    for a, b in inclusive_intervals(args.start, args.end, args.batch_size):
        batch_command = ['qsub', '-j', 'y', '-b', 'y', '-t', '%i-%s' % (a, b)]
        if jid is not None:
            batch_command += ['-hold_jid', jid]
        batch_command += command
        print(batch_command)
        qsub_out = subprocess.check_output(batch_command)
        jid_match = re.match(JID_REGEX, qsub_out)
        print(qsub_out)

        if not jid_match:
            print("Job ID not found. Not dispatching any more batches.")
            break

        jid = jid_match.group('jid')
