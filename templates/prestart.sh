#!/bin/bash
chown root:postgres /var/log/postgresql
chmod 1775 /var/log/postgresql
chown postgres:postgres /var/lib/postgresql/9.3
chmod 0755 /var/lib/postgresql/9.3
if [ ! -f /var/lib/postgresql/9.3/main/PG_VERSION ]; then
   /usr/bin/pg_dropcluster 9.3 main
   /usr/bin/pg_createcluster 9.3 main
   cp /etc/postgresql/9.3/default/postgresql.conf /etc/postgresql/9.3/main/postgresql.conf
   cp /etc/postgresql/9.3/default/pg_hba.conf /etc/postgresql/9.3/main/pg_hba.conf
   sudo -u postgres /usr/lib/postgresql/9.3/bin/pg_ctl -w -D /etc/postgresql/9.3/main start
   sudo -u postgres psql -c "ALTER USER postgres WITH UNENCRYPTED PASSWORD '{{ postgres_superuser_password }}'"
   sudo -u postgres /usr/lib/postgresql/9.3/bin/pg_ctl -w -D /etc/postgresql/9.3/main stop
fi
cp /etc/postgresql/9.3/default/postgresql.conf /etc/postgresql/9.3/main/postgresql.conf
cp /etc/postgresql/9.3/default/pg_hba.conf /etc/postgresql/9.3/main/pg_hba.conf
