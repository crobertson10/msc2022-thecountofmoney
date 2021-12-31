#!/usr/bin/env bash

set -o allexport
source ../.env
set +o allexport

unset -v latest
for file in ./*; do
    [[ $file -nt $latest ]] && latest=$file
done

gunzip < "$latest" | docker exec -i msc2022-thecountofmoney_database_1 psql -U "${POSTGRES_USER}" -d "$POSTGRES_DATABASE"