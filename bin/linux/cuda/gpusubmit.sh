#!/bin/sh
#
# Usage: gputest.sh
# Change job name and email address as needed 
#        
 
# -- our name ---
#$ -N backprop
#$ -S /bin/sh
# Make sure that the .e and .o file arrive in the
#working directory
#$ -cwd
#Merge the standard out and standard error to one file
#$ -j y
# Send mail at submission and completion of script
#$ -m be
#$ -M wj47@njit.edu
# Specify GPU queue
#$ -q datasci
# Request one gpu (max two)
#$ -l gpu=1
#$ -l hostname=node415
/bin/echo Running on host: `hostname`.
/bin/echo In directory: `pwd`
/bin/echo Starting on: `date`
 
# Load CUDA module
. /opt/modules/init/bash
module load cuda
#Full path to executable
mpstat -P ALL 1 &
nvidia-smi -l 1 &

/home/w/wj47/vGPU/apps/rodinia/bin/linux/cuda/backprop 160000
#(sleep 1;echo 1)|TERM=xterm script -c top &>1 & sleep 2;killall script|grep '^%Cpu'^C
#cat /proc/cpuinfo
