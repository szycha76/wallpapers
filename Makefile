
all: wren to-txt
	git add .
	git commit -m $$(date +%Y-%m%d-%H%M)
	git push

wren to-txt:
	echo '' | ./$@.sh
