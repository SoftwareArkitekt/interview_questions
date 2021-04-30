#!/bin/bash
# The sed commands can be run in one line to eliminate the step#.txt files, but I left them in for readability.
# I'm sure there are better ways of doing this, but this is what I had off the top of my head without 
# referring to the Internet. It would be more condensed (and accurate) if I used explicit regex -r flag, 
# but as I didn't think about that until seeing an example while checking my syntax, I decided not to use it.

# Explanation:
# Step 1: use the text "pic\" as a marker to replace everything before the .gif file with "["
sed 's/.*pic\//[/g' logfile.txt > step1.txt

# Step 2: use "HTTP/1.1" as a marker to replace everything in between the image name and status code with "] with code: ["
sed 's/ HTTP\/1\.1" /] with code: [/g' step1.txt > step2.txt

# Step 3: use the "-" as a marker to replace everyting after the status code with "]"
sed 's/....."-".*/]/g' step2.txt > results.txt
cat results.txt
