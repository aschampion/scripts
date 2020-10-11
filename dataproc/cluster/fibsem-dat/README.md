These scripts convert channel 0 (InLens) in a series of Janelia format FIBSEM .dat files into TIFFs.
This assumes the files are version 8, and does the "raw" conversion equivalent of Janelia's MATLAB code, just extracting the image data as 16 bit ints and adding 32768.
That is, none of the scaling information contained in the .dat header is applied.

