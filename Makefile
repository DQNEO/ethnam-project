local:  composer-local  vendor project

travis: composer-github vendor project

project: vendor
	vendor/bin/ethnam-generator add-project -b . Sample

vendor:
	composer install

composer-local:
	ln -s -f composer.json.local composer.json

composer-github:
	ln -s -f composer.json.github composer.json

clean:
	rm app bin etc lib locale log schema skel template tmp www -rf

destroy: clean
	rm .ethna composer.lock vendor -rf

