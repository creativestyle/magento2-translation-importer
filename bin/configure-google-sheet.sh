#!/usr/bin/env sh

# Check parameters count
if [ $# -lt 2 ]; then
    echo "USAGE: $0 param_name param_value"
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


# Set params
param_name="$1"
param_value="$2"


# Set configuration
${bin_dir}/google-sheets-downloader config:param:set "$param_name" "$param_value"
