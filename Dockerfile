FROM centos:7
#The RUN instruction will execute any commands in a new layer on top of the current image and commit the results
RUN yum update -y \
  && yum -y install unzip \
  && yum -y install java-1.8.0-openjdk-devel \
  && yum clean all
# ENV to update the PATH environment variable for the software your container installs, Each ENV line creates a new intermediate layer
ENV JAVA_HOME /usr/lib/jvm/java-1.8.0
ENV PATH "$PATH":/${JAVA_HOME}/bin:.:
#----Dockerfile for jar and main-class-----------------
#COPY target/env-sample-0.0.1-SNAPSHOT.jar /usr/src/env-sample-0.0.1-SNAPSHOT.jar
#Start app
#CMD java -cp /usr/src/env-sample-0.0.1-SNAPSHOT.jar com.probstl.StartEnv
#----layer for wildfly-----------------
ENV VERSION 13.0.0.Final
ENV INSTALL_DIR /opt
ENV WILDFLY_HOME ${INSTALL_DIR}/wildfly-${VERSION}
ENV DEPLOYMENT_DIR ${WILDFLY_HOME}/standalone/deployments/
ENV CONFIGURATION_DIR ${WILDFLY_HOME}/standalone/configuration
RUN useradd -b /opt -m -s /bin/sh -d ${INSTALL_DIR} serveradmin && echo serveradmin:serveradmin | chpasswd
RUN curl -O https://download.jboss.org/wildfly/${VERSION}/wildfly-${VERSION}.zip \
    && unzip wildfly-${VERSION}.zip -d ${INSTALL_DIR} \
    && rm wildfly-${VERSION}.zip \
    && chown -R serveradmin:serveradmin /opt \
    && chmod a+x ${WILDFLY_HOME}/bin/standalone.sh \
    && chmod -R a+rw ${INSTALL_DIR}
USER serveradmin
COPY target/env-sample-0.0.1-SNAPSHOT.war ${DEPLOYMENT_DIR}/env-sample-0.0.1-SNAPSHOT.war
ENTRYPOINT ${WILDFLY_HOME}/bin/standalone.sh -b=0.0.0.0
EXPOSE 8080

