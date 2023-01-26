#!/bin/bash

MOUNT_POINT="${MOUNT_POINT:-/data}"
FINAL_UID="${CUSTOM_UID:-1089}"
FINAL_GID="${CUSTOM_GID:-1090}"

run_git()
{
    # depends on the mounting method used,
    # files could belong to different uid, but the source should be trusted.
    git config --global --add safe.directory ${MOUNT_POINT}/workspace
    if [[ ! -z "${GIT_USERNAME}" ]];
    then
        git config --global credential.helper "/bin/bash /opt/scripts/credential_helper.sh"
    fi


    if [[ -d "${MOUNT_POINT}/workspace/.git/" ]];then
       git pull ${GIT_REPO}
    else
       git clone ${GIT_REPO} .
    fi
       
}

if [[ ! -z "${GIT_REPO}" ]];
then
    echo "Running git"
    run_git 
fi
# if it fails changing permissions, the exit of the script should be 0
chown --quiet -R ${FINAL_UID}:${FINAL_GID} ${MOUNT_POINT} || :


