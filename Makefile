
all:

clean:
	rm -fr *.egg-info dist build *.egg
scrub: clean
	rm -fr $(ve)

#ve_opt=--system-site-packages
ve=$(PWD)/ve
python=$(ve)/bin/python
ve: $(ve)
$(ve):
	virtualenv $(ve_opt) $@

install: $(ve)
	$(python) setup.py install
test: $(ve)
	$(python) setup.py test
develop:
	$(python) setup.py develop
push: $(ve)
	$(python) setup.py sdist register upload

httpd:
	python test.py 
####

cred_file=x.cred.json

oget:
	$(python) ourl.py oget $(cred_file) \
		'https://api.twitter.com/1.1/users/lookup.json?screen_name=gvanrossum' \
	| jq -M .

# request_selector='.', response_selector='.'
# should get 
# [{ "name": "Guido van Rossum", }, .. ]
opost:
	echo '{"screen_name": "gvanrossum"}' \
	| $(python) ourl.py opost $(cred_file) \
		'https://api.twitter.com/1.1/users/lookup.json' \
	| jq -M .

# extended input/output with {request,response}_selector
# should get
# { "request": { "screen_name": "gvanrossum" }, 
#   "response_headers": .., 
#   "response": [ { "name": "Guido van Rossum" } ] 
# }
oposte:
	echo '{ "request" : {"screen_name": "gvanrossum"} }' \
	| $(python) ourl.py opost $(cred_file) --request_selector=request --response_selector='response' \
		'https://api.twitter.com/1.1/users/lookup.json' \
	| jq -M .


get:
	$(python) ourl.py get http://localhost:8888/
