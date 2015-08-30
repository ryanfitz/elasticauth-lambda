
# SRC = $(shell find lib -name "*.js" -type f | sort)
# TESTSRC = $(shell find test -name "*.js" -type f | sort)

default: test

lint: $(SRC) $(TESTSRC)
	@node_modules/.bin/jshint --reporter node_modules/jshint-stylish/stylish.js $^
test: lint
	@node node_modules/lab/bin/lab -a code
validate:
	@node_modules/.bin/swagger-tools validate swagger.yaml

.PHONY: test validate
