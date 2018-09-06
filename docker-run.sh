#!/bin/bash

if [ $# -lt 1 ]
  then
    echo "Usage : $0 [ kkday-member-ci | kkday-mobile-member-ci | all | debug ]"
  exit
fi

case "$1" in  
  
  'debug')
    docker run -it --rm -p 8080:80 -v $(pwd)/kkday-member-ci:/kkday-member-ci -v $(pwd)/nginx/www:/etc/nginx/sites-enabled/default -v $(pwd)/certificate/KKday_Root_CA.crt:/usr/local/share/ca-certificates/KKday_Root_CA.crt -v $(pwd)/tools:/tools kkday-ci:latest /bin/bash
    ;;
  
  'kkday-member-ci')
    docker run -d -p 8080:80 -v $(pwd)/kkday-member-ci:/kkday-member-ci -v $(pwd)/nginx/www:/etc/nginx/sites-enabled/default -v $(pwd)/certificate/KKday_Root_CA.crt:/usr/local/share/ca-certificates/KKday_Root_CA.crt -v $(pwd)/tools:/tools kkday-ci:latest
    ;;
  
  'kkday-mobile-member-ci')
    docker run -d -p 8081:80 -v $(pwd)/kkday-mobile-member-ci:/kkday-mobile-member-ci -v $(pwd)/nginx/mobile:/etc/nginx/sites-enabled/default -v $(pwd)/certificate/KKday_Root_CA.crt:/usr/local/share/ca-certificates/KKday_Root_CA.crt -v $(pwd)/tools:/tools kkday-ci:latest
    ;;
  
  'all')
    docker run -d -p 8080:80 -v $(pwd)/kkday-member-ci:/kkday-member-ci -v $(pwd)/nginx/www:/etc/nginx/sites-enabled/default -v $(pwd)/certificate/KKday_Root_CA.crt:/usr/local/share/ca-certificates/KKday_Root_CA.crt -v $(pwd)/tools:/tools kkday-ci:latest

    docker run -d -p 8081:80 -v $(pwd)/kkday-mobile-member-ci:/kkday-mobile-member-ci -v $(pwd)/nginx/mobile:/etc/nginx/sites-enabled/default -v $(pwd)/certificate/KKday_Root_CA.crt:/usr/local/share/ca-certificates/KKday_Root_CA.crt -v $(pwd)/tools:/tools kkday-ci:latest
    ;;
esac

