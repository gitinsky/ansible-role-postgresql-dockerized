FROM gitinsky/baseimage:0.1.8
MAINTAINER Git In Sky <support@gitinsky.com>
EXPOSE 5432

ADD pgdg.list /etc/apt/sources.d/pgdg.list
RUN apt-get update && apt-get -y install postgresql-9.3
VOLUME /postgresql/
ADD postgresql.rb /etc/eye/postgresql.rb
