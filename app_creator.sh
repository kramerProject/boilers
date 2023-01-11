#! /bin/bash

set -o errexit
set -o nounset

echo "What is your app name?"
read appname

echo "What type of app do you want?"
read apptype

echo $apptype

templates=./python/templates

workdir=/tmp/$appname

sedcmd="s/{{APPNAME}}/$appname/g"

function setup() {
    rm -rf $workdir
    mkdir -p $workdir
}
function create_files() {
    echo "Creating $apptype app $appname"
    cat $templates/Makefile.tmpl | sed $sedcmd > $workdir/Makefile
    cp $templates/main.py $workdir/main.py
    cp $templates/requirements.txt $workdir/requirements.txt
    mkdir -p $workdir/services
    cp $templates/service.py $workdir/services/service.py
    mkdir -p $workdir/model
    cat $templates/model.tmpl | sed $sedcmd > $workdir/model/app_model.py
    cp $templates/base.py $workdir/model/base.py
    cat $templates/db.tmpl | sed $sedcmd > $workdir/model/db.py
    mkdir -p $workdir/__utils
    mkdir -p $workdir/tests
    mkdir -p $workdir/tests/files
    mkdir -p $workdir/init
    cat $templates/schema.tmpl | sed $sedcmd > $workdir/init/schema.sql
    cp $templates/tests.py $workdir/tests/tests.py
    cp $templates/.env $workdir/.env
    cp $templates/.gitignore $workdir/.gitignore
    cat $templates/docker-compose.tmpl | sed $sedcmd > $workdir/docker-compose.yml
    cp $templates/Dockerfile $workdir/Dockerfile
    cp $templates/README.md $workdir/README.md
}

setup
create_files
