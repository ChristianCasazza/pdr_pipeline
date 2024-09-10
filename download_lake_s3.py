import boto3
import os

# Define the S3 bucket name and object key
bucket_name = 'oceandatapublicbucket'
s3_key = 'duckdb.db'

# Get the directory of the current script (repo root)
repo_root = os.path.dirname(os.path.abspath(__file__))

# Define the local file path using the root of the repo
local_file_path = os.path.join(repo_root, 'duckdb.db')

# Initialize the S3 client
s3 = boto3.client('s3')

# Download the file from the S3 bucket
try:
    s3.download_file(bucket_name, s3_key, local_file_path)
    print(f"File downloaded successfully and saved to {local_file_path}")
except Exception as e:
    print(f"Error downloading file: {e}")
