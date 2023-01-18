#!/bin/bash

MOUNT_POINT="${MOUNT_POINT:-/data}"
FINAL_UID="${CUSTOM_UID:-1089}"
FINAL_GID="${CUSTOM_GID:-1090}"

run_git()
{
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
chown -R ${FINAL_UID}:${FINAL_GID} ${MOUNT_POINT}


