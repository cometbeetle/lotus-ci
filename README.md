# lotus-ci

A Docker image used for the `lotus` GitLab CI pipeline testing phase. 

The image includes:

* [Python 3.12](https://hub.docker.com/_/python)
* [Oracle Instant Client](https://www.oracle.com/database/technologies/instant-client/linux-x86-64-downloads.html) (version 23.5)
* [libaio1 library](https://pkgs.org/download/libaio1) (dependency of Instant Client)