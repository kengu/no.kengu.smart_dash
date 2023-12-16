#!/bin/bash

docker compose exec -T mariadb sh -c 'exec mysql -u"$MYSQL_USER" -p"$MYSQL_PASSWORD"' < ./backup/dump.sql

appwrite_volumes=(uploads cache config certificates functions)
# shellcheck disable=SC2068
for volume in ${appwrite_volumes[@]}; do
    docker run --rm --volumes-from "$(docker compose ps -q appwrite)" -v $PWD/backup:/restore ubuntu bash -c "cd /storage/$volume && tar xvf /restore/$volume.tar --strip 1"
done