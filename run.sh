#! /bin/bash
#PBS -N graphcast_train
#PBS -o /home/divij.khaitan_asp25/modulus-graphcast/out.log
#PBS -e /home/divij.khaitan_asp25/modulus-graphcast/err.log
#PBS -l ncpus=20
#PBS -q workq
#PBS -l host=gpu-h100
#PBS -k oe
#PBS -W depend=afterok:611.gpu-h100

export LD_PRELOAD=/home/divij.khaitan_asp25/.conda/envs/modulus/lib/libstdc++.so.6
export PYTORCH_CUDA_ALLOC_CONF=expandable_segments:True
# export CUDA_VISIBLE_DEVICES=1

module load anaconda3-2022.5
# module load /Datastorage/apps/utils/modulefiles/anaconda3-2024.02

conda init

source ~/.bashrc

conda activate modulus

cd /home/divij.khaitan_asp25/modulus-graphcast/modulus/examples/weather/unified_recipe/

# python3 -u train_graphcast.py
torchrun  --standalone --nnodes=1 --nproc_per_node=2 train_graphcast.py