#!/usr/bin/env python3

import subprocess

N5 = '/srv/volumes/fibsem/all-larvae.n5'
STACKS = {
    '1038': {
        'path': '1038/v1/raw',
        'coords': [4750, 3582, 5540],
        'size': [512, 512],
    },
    '1097': {
        'path': '1097/v1/raw',
        'coords': [4176, 3496, 3963],
        'size': [512, 512],
    },
    '1123': {
        'path': '1123/v1/raw',
        'coords': [4344, 3147, 4612],
        'size': [512, 512],
    },
    '1128': {
        'path': '1128/v1/raw',
        'coords': [3285, 3717, 3929],
        'size': [512, 512],
    },
    '1120': {
        'path': '1120/v0/raw',
        'coords': [5599, 5511, 8029],
        'size': [768, 768],
    }
}

RESOLUTION = [12] * 3
SCALES = {'s{}'.format(s): [2**s] * 3 for s in [0, 1, 5]}

VIEWS = {
    'xy': [0, 1, 2],
    'xz': [0, 2, 1],
}

for (stack, stack_params) in STACKS.items():
    for (scale, scale_factors) in SCALES.items():
        for (view, view_perm) in VIEWS.items():
            scale_coords = [s0 // f for (s0, f) in zip(stack_params['coords'], scale_factors)]

            half_size = [s // 2 for s in stack_params['size']]
            for (i, p) in enumerate(view_perm[0:2]):
                scale_coords[p] = max(0, scale_coords[p] - half_size[i])
            
            filename = 'em-peduncle-{}-{}-{}.png'.format(stack, scale, view)
            subprocess.run(['n5gest', 'slice-img', N5,
                '{}/{}'.format(stack_params['path'], scale),
                filename,
                '--origin', ','.join(map(str, scale_coords)),
                '--dims', ','.join(map(str, view_perm[0:2])),
                '--size', ','.join(map(str, stack_params['size']))],
                check=True)