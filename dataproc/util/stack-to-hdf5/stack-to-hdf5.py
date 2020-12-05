#!/usr/bin/env python

import argparse
import glob
import sys
from PIL import Image
import h5py

def chunk(s):
    try:
        x, y, z = map(int, s.split(','))
        return x, y, z
    except:
        raise argparse.ArgumentTypeError("Chunks must be x,y,z")

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="convert a glob of serial section images into an hdf5")
    parser.add_argument('images_glob', metavar='path', type=str)
    parser.add_argument('output', type=str)
    parser.add_argument('dataset', type=str)
    parser.add_argument('--chunk', default=(128,128,128), type=chunk)

    args = parser.parse_args()

    files = glob.glob(args.images_glob)
    files = sorted(files, key = lambda f: int(f.split('/')[-1].rsplit('.', 1)[0]))

    output = None
    z = 0
    for file in files:
        image = Image.open(file)
        if output is None:
            output = h5py.File(args.output, 'w')
            bounds = (len(files), image.size[1], image.size[0])
            dataset = output.create_dataset(args.dataset, bounds, dtype='u1', chunks=args.chunk)
        dataset[z,:,:] = image
        z += 1

    output.close()