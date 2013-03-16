update-all: update-htaccess update-css update-img update-html

clear-html:
	rm html/*.html*

update-robots:
	cd html;rsync -avz robots.txt vodka:~/osiux
	cd html;rsync -avz robots.txt merlot:~/html

update-htaccess:
	cd html;rsync -avz .htaccess vodka:~/osiux
	cd html;rsync -avz .htaccess merlot:~/html

update-html:
	cd html;rsync -avz *.html vodka:~/osiux
	cd html;rsync -avz *.html merlot:~/html

update-css:
	cd html;rsync -avz *.css vodka:~/osiux
	cd html;rsync -avz *.css merlot:~/html

update-img:
	cd html;rsync -avz *.ico vodka:~/osiux
	cd html;rsync -avz *.ico merlot:~/html

