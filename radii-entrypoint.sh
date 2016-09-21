#!/bin/bash

echo ${IRODS_ENVIRONMENT_JSON}
wget ${IRODS_ENVIRONMENT_JSON} -O /root/.irods/irods_environment.json
sudo iinit ${IRODS_PASSWORD}
exec "$@"
