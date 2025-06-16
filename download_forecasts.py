#!/usr/bin/env python
import calendar
from ecmwfapi import ECMWFService

# Initialize the MARS service
server = ECMWFService("mars")

# Define the year to download
year = 2022

# Loop through each month of the year
for month in range(1, 13):
    
    # Determine the start and end day for the current month
    start_date = f"{year}{month:02d}01"
    last_day_of_month = calendar.monthrange(year, month)[1]
    end_date = f"{year}{month:02d}{last_day_of_month}"
    
    # Define the output filename for the current month
    target_file = f"/Datastorage/divij.khaitan_asp25/hres_forecasts_2022/hres_{year}_{month:02d}_temp_precip.grib"
    
    print(f"--- Submitting request for {year}-{month:02d} ---")
    print(f"Data will be saved to: {target_file}")
    
    # Execute the MARS request for the current month
    server.execute(
        {
            "class": "od",
            "date": f"{start_date}/to/{end_date}",
            "expver": "1",
            "levtype": "sfc",
            # Parameters: 167.128 = 2m Temperature, 228.128 = Total Precipitation
            "param": "167.128/228.128",
            "step": "0/to/72/by/6", # Example: hourly to 7h, then 3-hourly to 10 days
            "stream": "oper",
            "time": "00:00:00/12:00:00",
            "type": "fc",
            "grid": "0.25/0.25", 
        },
        target_file
    )
    
    print(f"--- Successfully downloaded data for {year}-{month:02d} ---\n")

print("All monthly requests for the year have been processed.")