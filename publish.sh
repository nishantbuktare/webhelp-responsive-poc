#!/bin/sh
# Copy the LICENSE_KEY variable into 'licensekey.txt' in Oxygen Publishing Engine 
printf "%s" "$LICENSE_KEY" > ope/licensekey.txt
# The LICENSE_KEY variable does not contain new line character but '@@' instead
# Replace all the '@@' characters back to '\n' in the 'licensekey.txt' file
sed -i 's/@@/\n/g' ope/licensekey.txt
# Run the PDF CSS HTML5 transformation
ope/bin/dita -f pdf-css-html5 -i sample/space.ditamap -o sample/out/pdf-css-html5 -Dpdf.publishing.template=publishing  -Dpdf.publishing.template.descriptor=basket.opt
# Run the WebHelp Responsive transformation
ope/bin/dita -f webhelp-responsive -i sample/space.ditamap -o sample/out/webhelp-responsive -Dwebhelp.publishing.template=publishing  -Dwebhelp.publishing.template.descriptor=basket.opt