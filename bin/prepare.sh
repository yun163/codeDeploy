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
if [ ! -d $SVC_DIR ]; then
       sudo mkdir -p $SVC_DIR
       sudo chmod -R 755 $SVC_DIR
fi

#stop former service
svc -d $SVC_DIR

# clear work dir
rm -rf $WORK_DIR/src/*
rm -rf $WORK_DIR/bin/*
