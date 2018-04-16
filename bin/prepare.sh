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
	echo "golang not installed, begin install !!!"
	apt install golang-go -y
fi

SVC_DIR=/etc/service/zklocktest
svc -d $SVC_DIR
rm -rf $WORK_DIR/src/*
rm -rf $WORK_DIR/bin/*
