#!/bin/bash

TXT_FILE="output.txt"
WIC_FILE="image.wic"

# Content for TXT file
cat <<EOF > "$TXT_FILE"
Build Name : Sample Build
Date       : $(date)
Version    : 1.0.0
Status     : Success
EOF

# Content for WIC file (placeholder content)
cat <<EOF > "$WIC_FILE"
WIC IMAGE PLACEHOLDER
Image Name : image.wic
Generated  : $(date)
Note       : This is a dummy wic file for testing
EOF

echo "Files created with content:"
echo " - $TXT_FILE"
echo " - $WIC_FILE"

