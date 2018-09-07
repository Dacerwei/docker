#!/bin/bash

if [ $# -lt 1 ]
  then
    echo "Usage : $0 [ kkday-member-ci | kkday-mobile-member-ci | all | debug ]"
  exit
fi

case "$1" in  
  
  'debug')
    docker run -it --rm --name docker-member-ci -p 8080:443 -v $(pwd)/kkday-member-ci:/kkday-member-ci -v $(pwd)/nginx/www:/etc/nginx/sites-enabled/default -v $(pwd)/certificate/KKday_Root_CA.crt:/usr/local/share/ca-certificates/KKday_Root_CA.crt -v $(pwd)/certificate/localssl.crt:/etc/ssl/certs/localssl.crt -v $(pwd)/certificate/localssl.key:/etc/ssl/private/localssl.key -v $(pwd)/tools:/tools kkday-ci:latest /bin/bash
    ;;
  
  'kkday-member-ci')
    docker run -d -p 8080:443 --name docker-member-ci -v $(pwd)/kkday-member-ci:/kkday-member-ci -v $(pwd)/nginx/www:/etc/nginx/sites-enabled/default -v $(pwd)/certificate/KKday_Root_CA.crt:/usr/local/share/ca-certificates/KKday_Root_CA.crt -v $(pwd)/certificate/localssl.crt:/etc/ssl/certs/localssl.crt -v $(pwd)/certificate/localssl.key:/etc/ssl/private/localssl.key -v $(pwd)/tools:/tools kkday-ci:latest
    ;;
  
  'kkday-mobile-member-ci')
    docker run -d -p 8081:443 --name docker-mobile-member-ci -v $(pwd)/kkday-mobile-member-ci:/kkday-mobile-member-ci -v $(pwd)/nginx/mobile:/etc/nginx/sites-enabled/default -v $(pwd)/certificate/KKday_Root_CA.crt:/usr/local/share/ca-certificates/KKday_Root_CA.crt -v $(pwd)/certificate/localssl.crt:/etc/ssl/certs/localssl.crt -v $(pwd)/certificate/localssl.key:/etc/ssl/private/localssl.key -v $(pwd)/tools:/tools kkday-ci:latest
    ;;
  
  'all')
    docker run -d --name docker-member-ci -p 8080:443 -v $(pwd)/kkday-member-ci:/kkday-member-ci -v $(pwd)/nginx/www:/etc/nginx/sites-enabled/default -v $(pwd)/certificate/KKday_Root_CA.crt:/usr/local/share/ca-certificates/KKday_Root_CA.crt -v $(pwd)/certificate/localssl.crt:/etc/ssl/certs/localssl.crt -v $(pwd)/certificate/localssl.key:/etc/ssl/private/localssl.key -v $(pwd)/tools:/tools kkday-ci:latest

    docker run -d --name docker-mobile-member-ci -p 8081:443 -v $(pwd)/kkday-mobile-member-ci:/kkday-mobile-member-ci -v $(pwd)/nginx/mobile:/etc/nginx/sites-enabled/default -v $(pwd)/certificate/KKday_Root_CA.crt:/usr/local/share/ca-certificates/KKday_Root_CA.crt -v $(pwd)/certificate/localssl.crt:/etc/ssl/certs/localssl.crt -v $(pwd)/certificate/localssl.key:/etc/ssl/private/localssl.key -v $(pwd)/tools:/tools kkday-ci:latest
    ;;
esac

