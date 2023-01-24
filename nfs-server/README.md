# NFS Server

A NFS server to be used as pod container in a kubernetes environment. 


Based on https://github.com/kubernetes/examples/tree/master/staging/volumes/nfs/nfs-data
and https://wiki.archlinux.org/title/NFS

The original image was made by the kubernetes team, the problem is that it is based on centos and is outdated. 

This version is based on alpine and more opinated. By default, the following dir structure is built:

```
${BASE_DIR} ${IP_RANGE}(rw,sync,crossmnt,fsid=0,no_subtree_check)
${BASE_DIR}/workspace ${IP_RANGE}(rw,sync,nohide,no_subtree_check)
${BASE_DIR}/public ${IP_RANGE}(ro,all_squash,insecure,no_subtree_check)
```

You MUST set `IP_RANGE` variable. 




