#!/bin/bash
chown root:postgres /var/log/postgresql
chmod 1775 /var/log/postgresql
chown postgres:postgres /var/lib/postgresql/9.3
chmod 0755 /var/lib/postgresql/9.3
if [ ! -f /var/lib/postgresql/9.3/main/PG_VERSION ]; then
   /usr/bin/pg_dropcluster 9.3 main
   /usr/bin/pg_createcluster 9.3 main
fi
