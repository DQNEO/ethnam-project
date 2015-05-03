project: local
	vendor/bin/ethnam-generator add-project -b . Sample

local:
	ln -s -f composer.json.local composer.json
	composer install

clean:
	rm app bin etc lib locale log schema skel template tmp www -rf

destroy: clean
	rm .ethna composer.lock vendor -rf

