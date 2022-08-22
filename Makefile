VENDOR="./vendor/bin/"

.PHONY: phpcs-fixer phpstan phpcs phpcbf psalm phpmd phptool

phptool: phpcs-fixer phpstan phpcs phpcbf psalm phpmd

phpmd:
	$(VENDOR)phpmd src text ./phpmd.xml

phpcs:
	$(VENDOR)phpcs --standard=./phpcs.xml src

phpcbf:
	$(VENDOR)phpcbf --standard=./phpcs.xml src

phpstan:
	$(VENDOR)phpstan analyse src tests

phpcs-fixer:
	$(VENDOR)php-cs-fixer fix --config=.php-cs-fixer.dist.php src tests

psalm:
	$(VENDOR)psalm --config=./psalm.xml src tests --show-info=true

deptrac:
	$(VENDOR)deptrac analyse --config-file=deptrac.yaml