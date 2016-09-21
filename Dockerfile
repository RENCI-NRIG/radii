FROM ubuntu:14.04
MAINTAINER Claris Castillo <claris@renci.org>

#Install iRODS4.1.7 icommands extend by dcvan@renci.org
RUN apt-get update ; apt-get upgrade -y ; apt-get install -y wget libcurl4-gnutls-dev
RUN wget http://152.54.9.88:8000/irods/irods-resource-4.1.7-64bit.deb -O /tmp/irods-resource.deb
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y `dpkg -I /tmp/irods-resource.deb | sed -n 's/^ Depends: //p' | sed 's/,//g'`
RUN dpkg -i /tmp/irods-resource.deb


#Copy start-up script
COPY ./radii-entrypoint.sh /

RUN mkdir /root/.irods/

#Set entrypoint
ENTRYPOINT ["/radii-entrypoint.sh"]

EXPOSE 1247
CMD ["ils"]
