FROM gitinsky/baseimage:0.2.1
MAINTAINER Git In Sky <support@gitinsky.com>
EXPOSE 5432

ADD pgdg.list /etc/apt/sources.list.d/pgdg.list
RUN apt-get update && apt-get -y --allow-unauthenticated install sudo postgresql-9.6
VOLUME /postgresql/
ADD postgresql.rb /etc/eye/postgresql.rb
ADD prestart.sh /root/prestart.sh
