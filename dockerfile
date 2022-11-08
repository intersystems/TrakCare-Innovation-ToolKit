FROM docker.io/intersystems/irishealth-community:2022.1.0.209.0
#FROM store/intersystems/irishealth-community:2021.2.0.649.0
LABEL maintainer="Eslam Farahat <eslam.farahat@intersystems.com>"

# Varaibles
ARG link
ARG port
ENV _HTTPD_DIR /etc/apache2
ENV DEBIAN_FRONTEND=noninteractive

USER root

# Install GateWay
RUN apt-get update


RUN apt-get install -y apache2 debconf-utils sudo && a2enmod ssl && \
/bin/echo -e $ISC_PACKAGE_MGRUSER\\tALL=\(ALL\)\\tNOPASSWD: ALL >> /etc/sudoers &&\
sudo -u $ISC_PACKAGE_MGRUSER sudo echo enabled passwordless sudo-ing for $ISC_PACKAGE_MGRUSER

# Generate self signed certificate
RUN echo '* libraries/restart-without-asking boolean true' | debconf-set-selections && apt-get install -y openssl
RUN mkdir $_HTTPD_DIR/ssl && openssl req -x509 -nodes -days 1 -newkey rsa:2048 -subj /CN=* -keyout $_HTTPD_DIR/ssl/server.key -out $_HTTPD_DIR/ssl/server.crt

#Enable CSPGateway
COPY ./cspgateway/ /opt/cspgateway/bin
RUN cp /usr/irissys/csp/bin/CSPa24.so /opt/cspgateway/bin
RUN cp /usr/irissys/csp/bin/CSPa24Sys.so /opt/cspgateway/bin
#RUN cp /usr/irissys/csp/bin/libz.so /opt/cspgateway/bin

COPY httpd-csp.conf $_HTTPD_DIR/sites-available



RUN a2ensite httpd-csp && update-rc.d apache2 enable

USER irisowner

RUN echo "password" > /tmp/password.txt && /usr/irissys/dev/Container/changePassword.sh /tmp/password.txt

COPY . /tmp/src

WORKDIR /tmp/src

# Install
# $ISC_PACKAGE_INSTANCENAME name of the iris instance on docker, default IRIS, valued by InterSystems
# First start the instance quietly
RUN sudo service apache2 start && iris start $ISC_PACKAGE_INSTANCENAME quietly \
    && sh install.sh $ISC_PACKAGE_INSTANCENAME sys TRAKITKIT  \
    && iris stop $ISC_PACKAGE_INSTANCENAME quietly && sudo service apache2 stop

WORKDIR /home/irisowner/

# housekeeping
#USER root
#RUN rm -f $ISC_PACKAGE_INSTALLDIR/mgr/messages.log $ISC_PACKAGE_INSTALLDIR/mgr/alerts.log $ISC_PACKAGE_INSTALLDIR/mgr/IRIS.WIJ $ISC_PACKAGE_INSTALLDIR/mgr/journal/* \
#    && rm /tmp/password.txt.done && rm -fR /tmp/src

USER irisowner
