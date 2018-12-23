FROM centos:7
#The RUN instruction will execute any commands in a new layer on top of the current image and commit the results
RUN yum update -y \
  && yum -y install unzip \
  && yum -y install java-1.8.0-openjdk-devel \
  && yum clean all
# ENV to update the PATH environment variable for the software your container installs, Each ENV line creates a new intermediate layer
ENV JAVA_HOME /usr/lib/jvm/java-1.8.0
ENV PATH "$PATH":/${JAVA_HOME}/bin:.:
COPY target/env-sample-0.0.1-SNAPSHOT.jar /usr/src/env-sample-0.0.1-SNAPSHOT.jar