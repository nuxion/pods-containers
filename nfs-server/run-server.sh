#!/bin/bash
# Based on https://github.com/kubernetes/examples/blob/master/staging/volumes/nfs/nfs-data/run_nfs.sh

ensure_var()
{
    if [[ -z "${!1:-}" ]];
    then
        echo "${1} is unset"
        exit 1
    else
        echo "${1} is ${!1}"
    fi
}

function start()
{

    # prepare /etc/exports
    # IP_RANGE=$1
    # BASE_DIR="${2:-/srv/nfs}"
		# fsid=0: needed for NFSv4
		echo "${BASE_DIR} ${IP_RANGE}(rw,sync,crossmnt,fsid=0,no_subtree_check)" >> /etc/exports
		echo "${BASE_DIR}/workspace ${IP_RANGE}(rw,sync,nohide,no_subtree_check)" >> /etc/exports
		echo "${BASE_DIR}/public ${IP_RANGE}(ro,all_squash,insecure,no_subtree_check)" >> /etc/exports
		echo "Serving from $BASE_DIR"

		# start rpcbind if it is not started yet
		rpcinfo 127.0.0.1 > /dev/null; s=$?
		if [ $s -ne 0 ]; then
			 echo "Starting rpcbind"
			 rpcbind -w
		fi

		mount -t nfsd nfds /proc/fs/nfsd

		# -N 4.x: disable NFSv4
		# -V 3: enable NFSv3
		rpc.mountd -N 2 -V 3 -N 4 -N 4.1

		exportfs -r
		# -G 10 to reduce grace time to 10 seconds (the lowest allowed)
		rpc.nfsd -G 10 -N 2 -V 3 -N 4 -N 4.1 2
		rpc.statd --no-notify
		echo "NFS started"
}

function stop()
{
    echo "Stopping NFS"

    rpc.nfsd 0
    exportfs -au
    exportfs -f

    kill $( pidof rpc.mountd )
    umount /proc/fs/nfsd
    echo > /etc/exports
    exit 0
}

ensure_var $BASE_DIR
ensure_var $IP_RANGE
trap stop TERM

start 

# Ugly hack to do nothing and wait for SIGTERM
while true; do
    sleep 5
done
