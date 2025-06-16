#! /bin/bash
#PBS -N create_datasets
#PBS -o /home/divij.khaitan_asp25/modulus-graphcast/out.log
#PBS -e /home/divij.khaitan_asp25/modulus-graphcast/err.log
#PBS -l ncpus=20
#PBS -q workq
#PBS -l host=gpu-h100
#PBS -k oe

module load anaconda3-2022.5

conda init

source ~/.bashrc

conda activate modulus

export LD_PRELOAD=/home/divij.khaitan_asp25/.conda/envs/modulus/lib/libstdc++.so.6

# cd /Datastorage/divij.khaitan_asp25/forecasts_2022
# # curl -k -u divij.khaitan_asp25@ashoka.edu.in:9383e1155ce2971fac9442ad522c583e https://apps.ecmwf.int/api/streaming/public/blue/03/20250606-1040/f2/_mars-bol-webmars-public-svc-blue-000-cc6e94d7ef7081c98337ea0fbc3ce669-b4P_N8.grib 
# cat urls.txt | xargs -n 1 -P 2 -I {} curl -k -u divij.khaitan_asp25@ashoka.edu.in:9383e1155ce2971fac9442ad522c583e -O "{}"
# curl -k https://object-store.os-api.cci2.ecmwf.int/cci2-prod-cache-1/2025-06-11/5b2b8f4a25da12d7add418cac54eb788.grib -o cds_july_gfs.grib

cd modulus-graphcast
python3 -u download_forecasts.py

cd modulus-graphcast/modulus/examples/weather/unified_recipe
python3 -u hres_process.py
# python3 -u get_forecast_datasets.py