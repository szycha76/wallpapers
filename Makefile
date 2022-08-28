
all: wren to-txt
	git add .
	git commit -m $$(date +%Y-%m%d-%H%M); \
		git push --all origin; \
		git push --all upstream

wren to-txt:
	echo '' | ./$@.sh
