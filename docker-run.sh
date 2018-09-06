#!/bin/bash

docker run -d -p 8080:80 -v $(pwd)/kkday-member-ci:/kkday-member-ci -v $(pwd)/nginx/www:/etc/nginx/sites-enabled/default -v $(pwd)/certificate/KKday_Root_CA.crt:/usr/local/share/ca-certificates/KKday_Root_CA.crt kkday-member-ci:latest

docker run -d -p 8081:80 -v $(pwd)/kkday-mobile-member-ci:/kkday-mobile-member-ci -v $(pwd)/nginx/mobile:/etc/nginx/sites-enabled/default -v $(pwd)/certificate/KKday_Root_CA.crt:/usr/local/share/ca-certificates/KKday_Root_CA.crt kkday-member-ci:latest
