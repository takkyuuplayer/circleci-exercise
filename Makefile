.PHONY: vendor

COMPOSER=./composer.phar
DIR=$(dir $(realpath $(firstword $(MAKEFILE_LIST))))
PATH:=${DIR}/vendor/bin:$(PATH)
PHP=$(shell which php)

all: vendor update

vendor: composer.phar
	$(COMPOSER) install

update: composer/update vendor/update

test:
	cd ./ && phpunit tests

composer.phar:
	php -r "readfile('https://getcomposer.org/installer');" | php

composer/update:
	$(COMPOSER) self-update

vendor/update: composer.phar
	$(COMPOSER) update
