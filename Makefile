clear-html:
	rm html/*.html*

update:
	cd html;rsync -avz * vodka:~/osiux
	cd html;rsync -avz * merlot:~/html

