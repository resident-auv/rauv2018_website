
## Launch a local server.  Check the console output
#  for the address
serve: themes/ananke/README.md
	hugo serve --noHTTPCache

## Publish to:
##  https://depts.washington.edu/rauv/
##
## Need to have access to the web host ovid.u.washinton.edu
ovid: themes/ananke/README.md
	./publish_to_ovid.sh


themes/ananke/README.md:
	git submodule update --init

PHONY: ovid server
