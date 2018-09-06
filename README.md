# kkday docker

dockerfiles for kkday codeigniter projects

## Project Structure

```
| Dockerfile
| build.sh
| docker-run.sh
|-- certificate
|   |-- KKday_Root_CA.crt
|-- nginx
|   |-- www
|   |-- mobile
| kkday-member-ci (project folders)
| kkday-mobile-member-ci (project folders)
```

## Setup

### Prerequisites

  - docker

### Build

    $ ./build.sh
    # This script will build a clean image, including nginx, php5.6-fpm, and kkday certificate,
    # This step is required if you never build the image before, you can skip if you already had one

### Setup

    $ git clone git@github.com:kkday-it/kkday-member-ci.git
    $ git clone git@github.com:kkday-it/kkday-mobile-member-ci.git
    # put your kkday-member-ci, kkday-mobile-member-ci project in the folder

### Run

    $ ./docker-run.sh
    # Run up the environment
    # visit http://127.0.0.1:8080 (www)
    # visit http://127.0.0.1:8081 (mobile)
