clear-html:
	rm html/*.html*

update:
	cd html;rsync -avz * --exclude '*~' vodka:~/osiux
	cd html;rsync -avz * --exclude '*~' merlot:~/html

