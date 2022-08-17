#!/bin/bash

expr='/[0-9a-f]{64}$'
wd=$(cd $(dirname $0); pwd -P)

for file in $(find "$HOME/AppData/Local/Packages/Microsoft.Windows.ContentDeliveryManager_cw5n1h2txyewy/LocalState/Assets" | grep -E $expr); do
	desc=$(file $file | grep "$file: JPEG image data")
	if [[ ! -z "$desc" ]]; then
		for res in 1080x1920 1920x1080; do
			if [[ ! -z "$(echo $desc|grep ", $res, ")" ]]; then
				if [[ ! -f $res/$(basename $file).jpg ]]; then
					cp -v $file $res/$(basename $file).jpg
			  else
					echo -$res/$(basename $file)
				fi
				continue
			fi
		done
	fi
done

echo Press ENTER
read junk
