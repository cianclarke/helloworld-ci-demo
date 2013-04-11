CLOUDTESTS = cloud_tests/*.js
CLIENTTESTS = client_tests/*.js
NODEPATH = `pwd`/cloud:`pwd`/shared
NODEPATH_COVERAGE = `pwd`/cloud-cov:`pwd`/shared
REPORTER = dot

all: clean deps 

test: cloudtest 

cloudtest:
	@env NODE_PATH=$(NODEPATH) ./node_modules/.bin/mocha \
    --ui tdd \
		--reporter $(REPORTER) \
    --globals fh-nodeapp \
    --globals fh \
    --globals fhserver \
		--timeout 20000 \
		$(CLOUDTESTS)

clienttest: 
	phantomjs $(CLIENTTESTS)

deps:
	cd cloud; npm install .
	npm install . 


clean: 
	rm -rf cloud-cov
	rm -rf node_modules

.PHONY: cloud-cov test cloudtest all deps clienttest
