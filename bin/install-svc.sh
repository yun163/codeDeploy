#!/bin/bash
which svc
if [[ $? != 0 ]]; then
   	apt-get update
   	apt install daemontools
	if [ ! -f /lib/systemd/system/svscan.service ]; then
	    echo $'[Unit]\nDescription=Job that for svscan\n\n[Service]\nType=forking\nExecStart=/usr/bin/svscanboot\nRestart=on-failure\n\n[Install]\nWantedBy=multi-user.target' > /lib/systemd/system/svscan.service
		systemctl daemon-reload
		systemctl start svscan
	fi
fi
if [[ ! -d /etc/service/zklocktest ]]; then
	mkdir /etc/service/zklocktest
	cp -r bin/svc/* /etc/service/zklocktest
fi
