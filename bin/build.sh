#!/bin/bash
#AfterInstall
#install svc job
SVC_DIR=/etc/service/zklocktest
WORK_DIR=/opt/loopring/zklocktest

if [ ! -d $SVC_DIR ]; then
       sudo mkdir -p $SVC_DIR
       sudo cp -r $WORK_DIR/bin/svc/* /etc/service/zklocktest
fi

if [ "$GOPATH" = "" ]; then
        GOPATH=/usr/lib/go-1.6/src
fi

SRC_DIR=$GOPATH/github.com/codeDeploy/zk
echo $SRC_DIR
if [ ! -d $SRC_DIR ]; then
        sudo mkdir -p $SRC_DIR
fi

cd $SRC_DIR

echo "pwd = " + `pwd`
sudo rm -rf ./*
sudo cp -r $WORK_DIR/src/* ./
sudo chmod -R o+r ./

go build -ldflags -s -v -o $WORK_DIR/bin/zklocktest main/zklocktest.go
