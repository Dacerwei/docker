# kkday docker

dockerfiles for kkday codeigniter projects

## Project Structure

```
| Dockerfile
| build.sh
| docker-run.sh
|-- certificate
|   |-- KKday_Root_CA.crt
|   |-- localssl.crt
|   |-- localssl.key
|-- nginx
|   |-- www
|   |-- mobile
|-- tools
|   |-- uiLang.php
| kkday-member-ci (project folders)
| kkday-mobile-member-ci (project folders)
```

## Setup

### Prerequisites

  - docker

### Build

    $ ./build.sh
    # This script will build a clean image, including nginx, redis-server, php5.6-fpm, and kkday certificate,
    # This step is required if you never build the image before, you can skip if you already had one

### Setup

    $ git clone git@github.com:kkday-it/kkday-memeber-ci.git
    $ git clone git@github.com:kkday-it/kkday-mobile-member-ci.git
    # put your kkday-member-ci, kkday-mobile-member-ci project in the folder
    
### Hosts

    # Add following settings in your /etc/hosts
    # 127.0.0.1 www.dev.kkday.com
    # 127.0.0.1 m.dev.kkday.com

### Run

    $ ./docker-run.sh all
    # Run up the environment
    # visit https://www.dev.kkday.com:8080 (www)
    # visit https://m.dev.kkday.com:8081 (mobile)

### Update Redis

    $ docker exec -ti docker-member-ci sh -c "php /tools/uiLang.php"
    $ docker exec -ti docker-mobile-member-ci sh -c "php /tools/uiLang.php"
