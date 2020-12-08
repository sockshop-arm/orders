#!/usr/bin/env bash

IMAGE=orders

set -ev

SCRIPT_DIR=$(dirname "$0")

DOCKER_CMD=docker

CODE_DIR=$(cd $SCRIPT_DIR/..; pwd)
echo $CODE_DIR
$DOCKER_CMD run --rm -v $HOME/.m2:/root/.m2 -v $CODE_DIR:/usr/src/mymaven -w /usr/src/mymaven paperinik/rpi-maven clean install
cp -r $CODE_DIR/docker $CODE_DIR/target/docker/
cp -r $CODE_DIR/target/*.jar $CODE_DIR/target/docker/${IMAGE}

$DOCKER_CMD build -t codelab/orders $CODE_DIR/target/docker/${IMAGE};
