#!/bin/bash

gcc -c avilib.c
gcc -c find_ellipse.c
gcc -c track_ellipse.c
gcc -c misc_math.c
gcc -c track_ellipse_opencl.c
gcc -c OpenCL_helper_library.c
