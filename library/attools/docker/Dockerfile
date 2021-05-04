FROM centos:8

COPY entrypoint.sh /

COPY mongodb.repo /etc/yum.repos.d/

COPY tnsnames.ora /opt/oracle/network/

ENV TNS_ADMIN=/opt/oracle/network

WORKDIR /root

RUN dnf -y update && \
    dnf -y install bind-utils curl telnet nmap mysql traceroute wget libnsl libaio && \
    dnf -y module enable postgresql:12 && \
    dnf -y install postgresql && \
    wget https://download.oracle.com/otn_software/linux/instantclient/19800/oracle-instantclient19.8-basic-19.8.0.0.0-1.x86_64.rpm && \
    wget https://download.oracle.com/otn_software/linux/instantclient/19800/oracle-instantclient19.8-sqlplus-19.8.0.0.0-1.x86_64.rpm && \
    dnf -y install oracle-instantclient19.8-basic-19.8.0.0.0-1.x86_64.rpm && \
    dnf -y install oracle-instantclient19.8-sqlplus-19.8.0.0.0-1.x86_64.rpm && \
    rm -rf oracle-instantclient19.8-sqlplus-19.8.0.0.0-1.x86_64.rpm && \
    rm -rf oracle-instantclient19.8-sqlplus-19.8.0.0.0-1.x86_64.rpm && \
    chmod 744 /entrypoint.sh

ENTRYPOINT /entrypoint.sh
