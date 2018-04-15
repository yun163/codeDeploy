package zk

import (
	"fmt"
	"strings"
	"time"
)

type ZkLock struct {
	zkClient *Conn
	lockMap map[string]*Lock
}

const basePath = "/relay_lock"

func NewZkLock(zkServers string, timeout int) *ZkLock {
	client, _, err := Connect(strings.Split(zkServers,","), time.Second * time.Duration(timeout))
	if err != nil {
	}
	return &ZkLock{client, make(map[string]*Lock)}
}

func (l *ZkLock) TryLock(lockName string) {
	if _, ok := l.lockMap[lockName]; !ok {
		acls := WorldACL(PermAll)
		l.lockMap[lockName] = NewLock(l.zkClient, fmt.Sprintf("%s/%s", basePath, lockName), acls)
	}
	l.lockMap[lockName].Lock()
}

func (l *ZkLock) ReleaseLock(lockName string) {
	if innerLock, ok := l.lockMap[lockName]; ok {
		innerLock.Unlock()
	} else {
	}
}
