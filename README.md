# turbo-adventure




## Sparkdev

Docker container to use an instance of Apache Zeppelin configured with Apache Spark and Apache Hadoop. Just pull and use.

[DockerHub: https://hub.docker.com/r/israelzuniga/sparkdev/](https://hub.docker.com/r/israelzuniga/sparkdev/)


### Usage.
Linux/OSX:
`$   docker run -d -p 8080:8080 -p 4040:4040 --cpus=2.0 --memory=2048M -v "$PWD":/usr/zeppelin/notebook israelzuniga/sparkdev`

Windows:
`$   docker run -d -p 8888:8888 -p 4040:4040 --cpus=2.0 --memory=2048M -v "%CD%":/usr/zeppelin/notebook israelzuniga/sparkdev`


--
If you want to build it from scratch, clone this repo and then:

Build:
`$ docker build -t sparkdev .`



Run it:
`$ docker run --rm -it  -p 8080:8080 -p 4040:4040 -p 4141:4141 sparkdev`

---


## PostgreSQL 10 and pgAdmin4 with Crunchy Data  
Docker Compose configuration to setup an instance of PostgreSQL 10 and a PgAdmin4 web interface


### Usage:

It's highly suggested that you change the default login values in the next files `pg.env` and `pgadmin.env`.

Linux/OSX:
```bash

$ cd crunchypg_with_pg4admin
$ docker-compose up -d

```
First conifguration:
* After setup, go to http://localhost:5050/ and login with your established credentials for pgAdmin4.
* Once logged, select "Object" menu, then hover "Create" and "Server..."
* A pop-up window will appear. For the "General" tab write a meaningful name.
* Select "Connection" tab and only write `postgres` for hostname/address
* Write your credentials specified in `pg.env` file
* Someday, this will be solved or automated. [Track the issue at #1](#1)




https://info.crunchydata.com/blog/easy-postgresql-10-and-pgadmin-4-setup-with-docker
