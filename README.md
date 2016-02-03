# docker-powerdns-dock
[skydock](https://github.com/crosbymichael/skydock)+[skydns](https://github.com/skynetservices/skydns1)
analogue service based on PowerDNS

## Install environment
### Install PowerDNS backend
E.x. Postgres (ver. 9.5). Don't forget to change example variables:
- SOMEUSER
- SOMEPASSWORD
- SOMEKEY

In this example PowerDNS databases creates in SOMEUSER's namespace

```
docker run -d --name pdns-postgres \
       -e POSTGRES_USER=SOMEUSER \
       -e POSTGRES_PASSWORD=SOMEPASSWORD \
       postgres
```

### Install PowerDNS recursor

```
docker run -d --name pdns-recursor antage/pdns-recursor
```

### Install PowerDNS ( >= 3.4.x) connected with recursor and autocreating databases

* Run PowerDNS instance
```
docker run -d --name powerdns \
       --link pdns-postgres \
       --link pdns-recursor \
       artemkaint/powerdns-docker-dock \
       --no-config \
       --launch=gpgsql \
       --gpgsql-host=pdns-postgres \
       --gpgsql-port=5432 \
       --gpgsql-dbname=SOMEUSER \
       --gpgsql-user=SOMEUSER \
       --gpgsql-password=SOMEPASSWORD \
       --gpgsql-dnssec=yes \
       --daemon=no \
       --guardian=no \
       --loglevel=9 \
       --experimental-json-interface=yes \
       --experimental-api-key=SOMEKEY \
       --webserver=yes \
       --webserver-address=0.0.0.0 \
       --recursor=$(docker inspect -f "{{ .NetworkSettings.IPAddress }}" pdns-recursor)
```

#### License - MIT

Using some code from https://github.com/crosbymichael/skydock
Thanks to Michael Crosby. michael@crosbymichael.com
