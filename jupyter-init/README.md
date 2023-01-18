# Jupyter init image

This image is used for pre-mount a storage before scheduling a Jupyter Instance in
a kubernetes cluster. 

It was implemented for the jupyter use-cased but could be used in any case where a pre-volume init is needed. 


This image depends on the following env variables:

- `GIT_REPO` **optional**: a full git url, if this env is set a repository will be cloned in the root of the disk. If a `.git` folder already exist, then it will perform a pull.
- `GIT_USERNAME` & `GIT_PASSWORD` **optional**: to be used as credentiales. 
- `CUSTOM_UID` **optional**: which permissions will be assigned to the mountpoint. Default 1089.
- `CUSTOM_GID` **optional**: which permissions will be assigned to the mountpoint. Default 1090.
- `MOUNT_POINT` **optional**: root dir. Default /data

After this, the dir prepared for jupyter usage is `${MOUNT_POINT}/workspace`

## Example

See [examples/](examples/)

