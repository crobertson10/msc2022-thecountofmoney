#!/usr/bin/env bash

set -o allexport
source ../.env
set +o allexport

CURRENT_TIME=$(date "+%d-%m-%Y_%H-%M-%S")
ARCHIVE_NAME="backup_${CURRENT_TIME}.gz"


docker exec msc2022-thecountofmoney_database_1 pg_dumpall -c -U "${POSTGRES_USER}" | gzip > "./${ARCHIVE_NAME}"