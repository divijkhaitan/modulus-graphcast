import imdlib as imd

start_yr = 1951
end_yr = 2023
tmax = imd.get_data('tmax', start_yr, end_yr, fn_format='yearwise', file_dir='./tmax')
tmin = imd.get_data('tmin', start_yr, end_yr, fn_format='yearwise', file_dir='./tmin')
