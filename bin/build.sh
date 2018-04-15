!/bin/bash
#AfterInstall
#install svc job
SVC_DIR=/etc/service/zklocktest
WORK_DIR=/opt/loopring/zklocktest

if [[ ! -d $SVC_DIR ]]; then
       sudo mkdir -p $SVC_DIR
       sudo cp -r $WORK_DIR/bin/svc/* /etc/service/zklocktest
fi

cd $WORK_DIR
go build -ldflags -s -v -o bin/zklocktest zk/zklocktest.go
svc -d $SVC_DIR
