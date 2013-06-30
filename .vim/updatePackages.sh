#!/bin/bash
cd ~/Dropbox/Apps/st3/Packages;
find . -type d -name .git -exec sh -c "cd \"{}\"/../ && pwd && git pull" \;