
# Project Setup and Pipeline Execution

## Step 1: Create and Activate a Virtual Environment

To create a new virtual environment and activate it on Linux, run the following commands:

```bash
python3 -m venv newvenv
source newvenv/bin/activate
```

## Step 2: Make the `run_pipeline.sh` Script Executable

Before running the pipeline, ensure that the `run_pipeline.sh` script is executable. Use the following command:

```bash
chmod +x run_pipeline.sh
```

## Step 3: Running the Pipeline

Once the virtual environment is activated and the script is executable, run the pipeline with the following command:

```bash
./run_pipeline.sh
```

This will execute the full pipeline in sequence.

## How the Pipeline Works

1. **Ingest the Lake from S3**: 
   - The `run_pipeline.sh` script first runs `download_lake_s3.py`, which downloads a DuckDB lake file from a public S3 bucket and saves it to your local environment.
   
2. **Execute SQL Queries**:
   - After downloading the lake file, the script runs `python_scripts/duckdb_to_duckdb.py`. This script reads SQL queries from the `sql` folder, executes them on the DuckDB lake, and creates a new DuckDB file with the query results.
   
3. **Power the Evidence-Based Visualizations**:
   - The newly created DuckDB file is then used as a data source to power the Evidence-based visualizations. The visualizations are rendered through an Evidence app, and the markdown files for these visualizations can be found in the `pdr/pages` directory.

By following these steps, you can download, process, and visualize data seamlessly through the pipeline.

# Pro Tip: Using Harlequin with DuckDB

While inside your virtual environment (`venv`) in a terminal, you can use the following command to open your DuckDB file in a local SQL editor called Harlequin:

```bash
harlequin path/to/duckdb/file
```

This will open the specified DuckDB file (`.duckdb`) in a graphical interface where you can run SQL queries and inspect your data.

### Important Note:

After you're done working with the DuckDB file, **make sure to close the terminal window** where Harlequin was running. This ensures the connection to the DuckDB file is properly closed before you attempt to use the file elsewhere.

If you don't close the terminal, other processes might encounter issues when trying to open or modify the DuckDB file because the file will still be locked by the open connection.