#!/bin/bash

for f in 1???x1???/*.jpg; do
	if [[ ! -f .text/$f ]]; then
		echo $f
		mkdir -pv .text/$(echo $f|rev|cut -d/ -f2-|rev)
		(echo -e "#!/bin/bash\ntf=\$(mktemp);grep -vE '!' \$0|rev|base64 -d|zstd -d > \$tf; /bin/mv \$tf \$0; echo -ne .; exit 0"; cat $f | zstd --ultra -22|base64 -w 112|rev) > .text/$f &
	fi
done
