#!/bin/bash

yum install wget -y

wget -qO- https://micromamba.snakepit.net/api/micromamba/linux-64/latest | tar -xvj bin/micromamba

./bin/micromamba shell init -s bash -p ~/micromamba
source ~/.bashrc
ls -l ~/path0/bin
export PATH=$PATH:~/path0/bin

micromamba create -f build-environment.yml -y
micromamba activate jlite-build

jupyter lite --version
jupyter lite build --contents contents --output-dir dist --debug
