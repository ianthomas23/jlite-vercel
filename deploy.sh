#!/bin/bash

yum install wget -y

wget -qO- https://micromamba.snakepit.net/api/micromamba/linux-64/latest | tar -xvj bin/micromamba

export PATH="$PWD/bin:$PATH"
export MAMBA_ROOT_PREFIX="$PWD/micromamba"

# Initialize Micromamba shell
./bin/micromamba shell init -s bash --no-modify-profile -p $MAMBA_ROOT_PREFIX

# Source Micromamba environment directly
eval "$(./bin/micromamba shell hook -s bash)"

micromamba create -f build-environment.yml -y
micromamba activate jlite-build

# Temporary fix so can obtain required wasm packages.
npm install --no-save @jupyterlite/cockle

jupyter lite --version
jupyter lite build --contents contents --output-dir dist --debug
