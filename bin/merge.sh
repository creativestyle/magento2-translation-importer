#!/usr/bin/env sh

# Check parameters count
if [ $# -lt 2 ]; then
    echo "USAGE: $0 language repository_dir [google_config_file] [file_preference] [working_dir]"
    exit 1
fi


# Set base directory
base_dir=`dirname "$0"`


# Set other params
language="$1"


# Set repository dir and repository CSV path
repository_dir=`realpath "$2"`
repository_csv_path="$repository_dir/${language}.csv"


# Set merge preference
file_preference="${4:-left}"
merge_options="--sort --sanitize"
if [ "$file_preference" == "right" ]; then
    merge_options="$merge_options --prefer-right"
fi


# Set Google config file
if [ -n "$3" ]; then
    google_config_file=`realpath "$3" 2>/dev/null`
else
    google_config_file=`realpath "$basedir/../etc/google-sheets-downloader/config.json" 2>/dev/null`
fi


# Set working directory
if [ -n "$5" ]; then
    working_dir=`realpath "$5" 2>/dev/null`
else
    working_dir=`mktemp -d -t translations.XXXXX`
fi


# Set output path for Google download
remote_csv_path="$working_dir/${language}.csv"


# Perform sheet download
${base_dir}/download-google-sheet.sh "$language" "$remote_csv_path" "$google_config_file"


# Perform CSV files merge
${base_dir}/merge-csv-files.sh "$repository_csv_path" "$remote_csv_path" "$repository_csv_path" "$merge_options"


# Clear working directory
rm -rf "$working_dir"
