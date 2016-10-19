#!/bin/bash

USERNAME="t3kit"
PASSWORD="t3kit1234"
DATABASE="t3kit"
DATABASEHOST="db"
echo "DB container staring ..."
sleep 5
RESULT=`mysql -h db -u t3kit -pt3kit1234 t3kit --skip-column-names -e "SHOW TABLES LIKE 'be_users'"`
if [ "$RESULT" == "be_users" ]; then
    echo "Table exist"
else
    /var/www/shared/db/restoredb.sh
fi

exec "$@"
