# radii-docker

Docker implementation of iRODS V4.1.7 radii-fied.

##Pull from dockerhub##
`docker pull claris/radii-sc16`

##Usage##
Pass environment variables to startup script using `docker run` options.  To date (9/21/2016) two variables are required:

* `IRODS_ENVIRONMENT_JSON` *must* be a URL to an irods_environment json file.  See [Configuration Files in iRODS](https://docs.irods.org/4.1.7/manual/configuration/)
* `IRODS_PASSWORD` is the password for the iRODS user (default username is _claris_ at the moment). It is used to create the irodsA file via invocation of `iinit` at boot time.

Docker command to instantiate container:

```docker run -ti -e IRODS_ENVIRONMENT_JSON=http://X.X.X.X:8080/irods/filename.json \
-e IRODS_PASSWORD=mypassword claris/radii-sc16```

Run `ils` inside the container to test that it is configured correctly.  Expected output is a list of files in the IRODS datagrid configured via the irods_environment.json file visible to user _claris_. For example:

`root@b38892cc1da0:/# ils
/ncdsObservatory/home/claris:
  hola.text
`
#Example of irods_environment.json#

```{
    "irods_host": "observatory.data2discovery.org",

    "irods_port": 1247,

    "irods_default_resource": "ncdsResc",

    "irods_user_name": "claris",

    "irods_server_control_plane_port": 1248,

    "irods_server_control_plane_key": "0bservatory0bservatory0bservator",

    "irods_server_control_plane_encryption_num_hash_rounds": 16,

    "irods_server_control_plane_encryption_algorithm": "AES-256-CBC",

    "irods_zone_name": "ncdsObservatory"
    }```

##References##
* [How to pass app configuration to Docker] (https://dantehranian.wordpress.com/2015/03/25/how-should-i-get-application-configuration-into-my-docker-containers/)
* [Device Mapper 101] (https://docs.docker.com/engine/userguide/storagedriver/device-mapper-driver/)
* [Docker configuration options] (https://docs.docker.com/engine/reference/commandline/dockerd/)
* [Adjust memory and swap accounting to respect VM mem allocation] (https://docs.docker.com/engine/installation/linux/ubuntulinux/#/adjust-memory-and-swap-accounting)



