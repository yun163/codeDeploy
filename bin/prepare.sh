!/bin/bash
#BeforeInstall
WORK_DIR=/opt/loopring/zklocktest
if [ ! -d $WORK_DIR ]; then
	mkdir $WORK_DIR
	chown -R ubuntu:ubuntu $WORK_DIR
fi
which go
if [[ $? != 0 ]]; then
	apt install golang-go -y
fi
