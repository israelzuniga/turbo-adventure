# turbo-adventure
YADFZAS: Yet-Another-Dockerfile-For-Zeppelin-And-Spark

---
Docker container to use an instance of Apache Zeppelin configured with Apache Spark and Apache Hadoop. Just pull and use.


Usage:
`$ docker run israelzuniga/sparkdev`



---
If you want to build it from scratch:

Build:
`$ docker build -t sparkdev .`



Run it:
`$ docker run --rm -it  -p 8080:8080 -p 4040:4040 -p 4141:4141 sparkdev`
