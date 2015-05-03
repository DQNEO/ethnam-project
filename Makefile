local:  composer-local  vendor project-base

travis: composer-github vendor project-base

project: project-base
	vendor/bin/ethnam-generator add-action hello
	vendor/bin/ethnam-generator add-view -t hello
	vendor/bin/ethnam-generator add-template hello2

project-base: vendor
	vendor/bin/ethnam-generator add-project -b . Sample

vendor:
	composer install

composer-local:
	ln -s -f composer.json.local composer.json

composer-github:
	ln -s -f composer.json.github composer.json

clean-app:
	rm .ethna app bin etc lib locale log schema skel template tmp www -rf

destroy: clean
	rm .ethna composer.lock vendor -rf

test: project
	test -d app
	test -d www
	test -e .ethna
	test -f app/action/Hello.php
	test -f app/view/Hello.php
	test -f template/ja_JP/hello.tpl
	test -f template/ja_JP/hello2.tpl
