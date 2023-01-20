#!/bin/bash
set -e
pgbackrest --stanza=${STANZA_NAME} --log-level-console=info stanza-create
