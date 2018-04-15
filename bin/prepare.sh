#!/bin/bash
#BeforeInstall
WORK_DIR=/opt/loopring/zklocktest
if [ ! -d $WORK_DIR ]; then
	mkdir -p $WORK_DIR/src
	mkdir -p $WORK_DIR/bin
	chown -R ubuntu:ubuntu $WORK_DIR
fi

which go
if [[ $? != 0 ]]; then
	apt install golang-go -y
fi

sudo svc -d $SVC_DIR
sudo rm $WORK_DIR/src/*
sudo rm $WORK_DIR/bin/*

