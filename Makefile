update-all: update-css update-img update-html

clear-html:
	rm html/*.html*

update-html:
	cd html;rsync -avz *.html --exclude '*~' vodka:~/osiux
	cd html;rsync -avz *.html --exclude '*~' merlot:~/html

update-css:
	cd html;rsync -avz *.css --exclude '*~' vodka:~/osiux
	cd html;rsync -avz *.css --exclude '*~' merlot:~/html

update-img:
	cd html;rsync -avz *.ico --exclude '*~' vodka:~/osiux
	cd html;rsync -avz *.ico --exclude '*~' merlot:~/html

