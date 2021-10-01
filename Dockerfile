# syntax=docker/dockerfile:1

FROM ubuntu:18.04

LABEL maintainer="Alex Moshniaha  <ivanmoshnyaga@gmail.com>"

RUN apt-get update && \
    apt-get -qy full-upgrade && \
    apt-get install -qy git && \
# Install a basic SSH server
    apt-get install -qy openssh-server && \
    sed -i 's|session    required     pam_loginuid.so|session    optional     pam_loginuid.so|g' /etc/pam.d/sshd && \
    mkdir -p /var/run/sshd && \
# Install JDK 16
   apt install -qy default-jre && \
   apt install -qy default-jdk && \
# Install maven
    apt-get install -qy maven && \
# Cleanup old packages
    apt-get -qy autoremove && \
# Add user alexm to the image
    adduser --quiet ubuntu && \
# Set password for the alexm user
    echo "ubuntu:ubuntu" | chpasswd && \
    mkdir /home/ubuntu/.m2

COPY .m2/settings.xml /home/ubuntu/.m2/settings.xml

RUN chown -R ubuntu:ubuntu /home/ubuntu/.m2/

# Standard SSH port
EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]


#build project
WORKDIR /app

COPY .mvn/ .mvn
COPY mvnw pom.xml ./
RUN ./mvnw dependency:go-offline

COPY src ./src

CMD ["./mvnw", "spring-boot:run"]
