#!/bin/bash

# Step 1: Run the download_lake_s3.py script (relative to the script location)
echo "Running download_lake_s3.py..."
python $(dirname "$0")/download_lake_s3.py

# Step 2: Run the duckdb_to_duckdb.py script located in python_scripts (relative to the script location)
echo "Running duckdb_to_duckdb.py..."
python $(dirname "$0")/python_scripts/duckdb_to_duckdb.py

# Step 3: Change directory to 'pdr' (relative to the script location)
echo "Changing directory to 'pdr'..."
cd $(dirname "$0")/pdr || exit

# Step 4: Run npm install
echo "Running npm install..."
npm install

# Step 5: Run npm run sources
echo "Running npm run sources..."
npm run sources

# Step 6: Run npm run dev
echo "Running npm run dev..."
npm run dev

echo "Pipeline completed."
