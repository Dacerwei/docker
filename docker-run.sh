#!/bin/bash

docker run -d -p 81:80 -v $(pwd)/kkday-member-ci:/kkday-member-ci -v $(pwd)/nginx/www:/etc/nginx/sites-enabled/default -v $(pwd)/certificate/KKday_Root_CA.crt:/usr/local/share/ca-certificates/KKday_Root_CA.crt kkday-member-ci:latest