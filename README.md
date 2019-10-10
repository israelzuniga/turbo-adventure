# turbo-adventure
Containers configuration saved from other tasks related to work or personal projects


## Sparkdev

Docker container to use an instance of Apache Zeppelin configured with Apache Spark and Apache Hadoop. Just pull and use.

[DockerHub: https://hub.docker.com/r/israelzuniga/sparkdev/](https://hub.docker.com/r/israelzuniga/sparkdev/)


### Usage
Linux/OSX:
`$   docker run -d -p 8080:8080 -p 4040:4040 --cpus=2.0 --memory=2048M -v "$PWD":/usr/zeppelin/notebook israelzuniga/sparkdev`

Windows:
`$   docker run -d -p 8888:8888 -p 4040:4040 --cpus=2.0 --memory=2048M -v "%CD%":/usr/zeppelin/notebook israelzuniga/sparkdev`


### Building the sources

If you want to build it from scratch, clone this repo and then:

Build:
`$ docker build -t sparkdev .`



Run it:
`$ docker run --rm -it  -p 8080:8080 -p 4040:4040 -p 4141:4141 sparkdev`

---


## PostgreSQL 10 and pgAdmin4 with Crunchy Data  
Docker Compose configuration to setup an instance of PostgreSQL 10 and a PgAdmin4 web interface.
This is based on the next web post by Crunchy Data: https://info.crunchydata.com/blog/easy-postgresql-10-and-pgadmin-4-setup-with-docker. Personally, I didn't like the manual execution of steps described. So, I am working in a more automated procedure to use the tools.


### Settings

It's highly suggested that you change the default login values in the next files `pg.env` and `pgadmin.env`.

Which details are specified in those files? They are storing environment variables that are used while Docker is creating the containers. Please refer to:

#### File: *pg.env*

Setting | Meaning
-----|---------
PG_MODE | A parameter just for crunchy-postgres that determines how to setup this PostgreSQL instance.  Other options include "replica" for creating a read-only instance, as well as "set" for creating a StatefulSet in a [Kubernetes cluster](https://info.crunchydata.com/blog/deploying-postgresql-clusters-kubernetes-statefulsets)
PG_PRIMARY_USER | Sets the username of the superuser for your database instance.
PG_PRIMARY_PASSWORD | The password for the PG_PRIMARY_USER in your database instance.
PG_DATABASE | The name of the default database to create in the database instance.
PG_USER | The username of the default user in the database instance.  This user will have access to PG_DATABASE
PG_PASSWORD | The password for PG_USER
PG_ROOT_PASSWORD | The password for the "postgres" user  in your database instance, which is the root user.
PG_PRIMARY_PORT | The database port that PostgreSQL will run on.  The default PostgreSQL port is 5432.

#### File: *pgadmin.env*

Setting | Meaning
-----|---------
PGADMIN_SETUP_EMAIL | The email address used to log into pgAdmin 4
PGADMIN_SETUP_PASSWORD | The password used to log into pgAdmin 4
SERVER_PORT | The port to run pgAdmin 4 on.

### Usage
After configution, execute:

Linux/OSX:
```bash
$ cd crunchypg_with_pg4admin
$ docker-compose up -d
```

Windows:

To be defined.


First configuration:
* After setup, go to http://localhost:5050/ and login with your established credentials for pgAdmin4.
* Once logged, select "Object" menu, then hover "Create" and "Server..."
* A pop-up window will appear. For the "General" tab write a meaningful name.
* Select "Connection" tab and only write `postgres` for hostname/address
* Write your credentials specified in `pg.env` file
* Someday, this will be solved or automated. [Track the issue at issues](https://github.com/israelzuniga/turbo-adventure/issues/1)


## homomorphic encryption with PySEAL for Machine Learning

### Description


### Usage
Build Docker image:
`docker build -t seal-python -f Dockerfile .`


Run Jupyter server with `./run-jupyter.sh`
