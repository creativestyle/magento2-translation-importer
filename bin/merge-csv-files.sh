#!/usr/bin/env sh

# Check parameters count
if [ $# -lt 3 ]; then
    echo "USAGE: $0 left_file_path right_file_path output_path [merge_options]"
    exit 1
fi


# Set base directory
base_dir=`dirname "$0"`


# Set executables directory
bin_dir=`realpath "$base_dir/../vendor/bin" 2>/dev/null`
if ! [ -d "$bin_dir" ]; then
    echo "ERROR! Vendors' bin directory not found. Aborting!"
    exit 1
fi


# Set other params
left_file_path="$1"
right_file_path="$2"
output_path="$3"


# Create directory for output file
output_dir=`dirname "$output_path"`
if ! [ -d "$output_dir" ]; then
    mkdir -p "$output_dir"
fi


# Perform CSV files merge
${bin_dir}/csv-merger merge $4 "$left_file_path" "$right_file_path" "$output_path"
