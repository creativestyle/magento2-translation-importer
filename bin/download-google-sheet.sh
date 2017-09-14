#!/usr/bin/env sh

# Check parameters count
if [ $# -lt 2 ]; then
    echo "USAGE: $0 language output_path [config_file]"
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


# Set Google Sheets Downloader config file
if [ -n "$3" ]; then
    config_file=`realpath "$3" 2>/dev/null`
else
    config_file=`realpath "$base_dir/../etc/google-sheets-downloader/config.json" 2>/dev/null`
fi

if ! [ -f "$config_file" ]; then
    echo "ERROR! Google Sheets Downloader config file not found. Aborting!"
    exit 1
fi


# Set other params
language="$1"
output_path="$2"


# Create directory for output file
output_dir=`dirname "$output_path"`
if ! [ -d "$output_dir" ]; then
    mkdir -p "$output_dir"
fi


# Perform sheet download
${bin_dir}/google-sheets-downloader download --config-file="$config_file" --sheet-title="$language" --save "$output_path"
