package main

import (
	"time"
	zk "github.com/codeDeploy/zk"
	"math/rand"
	"fmt"
)
const lockName = "test"

func main() {
	testLock := zk.NewZkLock("127.0.0.1:2181", 5)
	rng := rand.New(rand.NewSource(time.Now().UnixNano()))
	for i := 0; i < 100; i++ {
		testLock.TryLock(lockName)
		fmt.Printf("[%s] access lock success\n", time.Now().Format(time.RFC3339))
		time.Sleep(time.Second * 10)
		testLock.ReleaseLock(lockName)
		waitSecond := rng.Intn(2)
		fmt.Printf("[%s] release lock after 10 seconds, an will wait %d seconds >>>>>>>>>\n", time.Now().Format(time.RFC3339), waitSecond)
		if waitSecond > 0 {
			time.Sleep(time.Second * time.Duration(waitSecond))
		}
	}
}
