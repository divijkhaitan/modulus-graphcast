#! /bin/bash
#PBS -N plot_figures
#PBS -o /home/divij.khaitan_asp25/modulus-graphcast/out.log
#PBS -e /home/divij.khaitan_asp25/modulus-graphcast/err.log
#PBS -l ncpus=20
#PBS -q workq
#PBS -l host=gpu-h100
#PBS -k oe
##PBS -W depend=afterok:712.gpu-h100

# export PYTORCH_CUDA_ALLOC_CONF=expandable_segments:True
# export CUDA_VISIBLE_DEVICES=1

module load anaconda3-2022.5
# module load /Datastorage/apps/utils/modulefiles/anaconda3-2024.02

conda init

source ~/.bashrc

conda activate modulus

export LD_PRELOAD=/home/divij.khaitan_asp25/.conda/envs/modulus/lib/libstdc++.so.6

cd /home/divij.khaitan_asp25/modulus-graphcast/modulus/examples/weather/unified_recipe/

# python -c "import pandas"
# python3 eval_graphcast.py
python3 -u spatial_errors.py
# python3 -u time_series_errors.py