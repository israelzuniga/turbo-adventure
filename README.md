# turbo-adventure
YADFZAS: Yet-Another-Dockerfile-For-Zeppelin-And-Spark

---
Docker container to use an instance of Apache Zeppelin configured with Apache Spark and Apache Hadoop. Just pull and use.


Usage.
Linux/OSX:
`$   docker run -d -p 8080:8080 -p 4040:4040 --cpus=2.0 --memory=2048M -v "$PWD":/usr/zeppelin/notebook israelzuniga/sparkdev`

Windows:
`$   docker run -d -p 8888:8888 -p 4040:4040 --cpus=2.0 --memory=2048M -v "%CD%":/usr/zeppelin/notebook israelzuniga/sparkdev`


---
If you want to build it from scratch, clone this repo and then:

Build:
`$ docker build -t sparkdev .`



Run it:
`$ docker run --rm -it  -p 8080:8080 -p 4040:4040 -p 4141:4141 sparkdev`
