#!/bin/bash

DIR="vendor/squizlabs/php_codesniffer/CodeSniffer/Standards"
SF2DIR="$DIR/Symfony2"

if [[ ! -e $SF2DIR ]]; then
    cd $DIR
    git clone git@github.com:lapistano/Symfony2-coding-standard.git Symfony2
else
    cd $SF2DIR
    git pull
fi
