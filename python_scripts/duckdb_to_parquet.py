#Duckdb Lake to put output files as seperate parquet files
import duckdb
import os
import pyarrow as pa
import pyarrow.parquet as pq

# File paths
original_duckdb_file = '/home/christianocean/pdr_pipeline/duckdb.db'
query_folder = '/home/christianocean/pdr_pipeline/sql'
parquet_output_folder = '/home/christianocean/pdr_pipeline/output_parquet'

# Ensure the output folder exists
if not os.path.exists(parquet_output_folder):
    os.makedirs(parquet_output_folder)

# Connect to the original DuckDB file (to read data)
original_conn = duckdb.connect(original_duckdb_file)

# Get all SQL files in the query folder
query_files = [f for f in os.listdir(query_folder) if f.endswith('.sql')]

# Loop through each SQL query file and execute them on the original DuckDB file
for query_file in query_files:
    # Read SQL query from file
    with open(os.path.join(query_folder, query_file), 'r') as file:
        query = file.read()

    # Derive table name from file name (removing '.sql' extension)
    table_name = query_file.replace('.sql', '')
    
    # Run the query on the original DuckDB file and fetch result as an Arrow Table
    arrow_table = original_conn.execute(query).arrow()
    
    # Define Parquet file path
    parquet_file_path = os.path.join(parquet_output_folder, f"{table_name}.parquet")
    
    # Write the Arrow Table to Parquet file using PyArrow
    pq.write_table(arrow_table, parquet_file_path)
    
    print(f"Table {table_name} written to {parquet_file_path} as a Parquet file.")

# Close connection to DuckDB
original_conn.close()

print("Queries have been executed and results stored as Parquet files.")

