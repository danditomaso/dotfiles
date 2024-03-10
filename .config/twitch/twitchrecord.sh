#!/bin/bash

# Check if both parameters are provided
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <suffix_string> <yt-dlp_argument>"
    exit 1
fi

cd ~/Downloads/

# Get the current date in the specified format
date_suffix=$(date "+%F_%H-%M-%S")

# Append the first parameter to the date suffix
output_filename="${date_suffix}_${1}"

# Run yt-dlp with the provided arguments
yt-dlp -o "$output_filename" "$2"


