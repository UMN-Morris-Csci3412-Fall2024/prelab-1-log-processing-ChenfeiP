#!/bin/bash

# Check if the correct number of arguments is provided
if [ "$#" -ne 3 ]; then
    echo "Usage: $0 <contents_file> <specifier> <output_file>"
    exit 1
fi

# Assign arguments to variables for better readability
contents_file=$1
specifier=$2
output_file=$3

# Construct the header and footer file names using the specifier
header_file="${specifier}_header.html"
footer_file="${specifier}_footer.html"

# Check if the contents, header, and footer files exist
if [ ! -f "$contents_file" ]; then
    echo "Contents file $contents_file does not exist."
    exit 1
fi

if [ ! -f "$header_file" ]; then
    echo "Header file $header_file does not exist."
    exit 1
fi

if [ ! -f "$footer_file" ]; then
    echo "Footer file $footer_file does not exist."
    exit 1
fi

# Concatenate header, contents, and footer into the output file
cat "$header_file" "$contents_file" "$footer_file" > "$output_file"

# Notify the user that the file has been created
echo "Output written to $output_file"
