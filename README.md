# radii-docker

Docker implementation of iRODS V4.1.7 radii-fied.

##Pull from dockerhub##
`docker pull claris/radii-sc16`

##Usage##
Pass environment variables to startup script using `docker run` options.  To date (9/21/2016) two variables are required:

* `IRODS_ENVIRONMENT_JSON` *must* be a URL to irods_environment json file. See [Configuration Files in iRODS](https://docs.irods.org/4.1.7/manual/configuration/)
* `IRODS_PASSWORD` is the password for the iRODS user (default username is claris at the moment)

Docker command to instantiate container:

`docker run -rm -e IRODS_ENVIRONMENT_JSON=http://X.X.X.X:8080/irods/irods_environment.json -e IRODS_PASSWORD=mypassword claris/radii-sc16`

##References##




