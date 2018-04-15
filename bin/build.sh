!/bin/bash
#AfterInstall
cd /opt/loopring/zklocktest/
go build -ldflags -s -v -o bin/zklocktest zk/zklocktest.go
svc -d /etc/service/zklocktest
