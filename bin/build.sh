#!/bin/bash
#AfterInstall
#install svc job
WORK_DIR=/opt/loopring/zklocktest
SVC_DIR=/etc/service/zklocktest

#cp svc config to des
sudo cp -rf $WORK_DIR/bin/svc/* $SVC_DIR
sudo chmod -R 755 $SVC_DIR

if [ "$GOPATH" = "" ]; then
        GOPATH=/usr/lib/go-1.6/src
fi

SRC_DIR=$GOPATH/github.com/codeDeploy/zk
if [ ! -d $SRC_DIR ]; then
        sudo mkdir -p $SRC_DIR
fi

cd $SRC_DIR
echo "cp source files to GOPATH dir : " + `pwd`
sudo rm -rf ./*
sudo cp -r $WORK_DIR/src/* ./
sudo chmod -R o+r ./

go build -ldflags -s -v -o $WORK_DIR/bin/zklocktest main/zklocktest.go
