FROM centos:7
WORKDIR /opt

ADD https://nxlog.co/system/files/products/files/348/nxlog-ce-2.10.2150-1_rhel7.x86_64.rpm /opt/

RUN yum update -y

RUN yum install -y /opt/nxlog-ce-2.10.2150-1_rhel7.x86_64.rpm

RUN yum clean all && \
rm -rf /var/cache/yum && \
rm -f /opt/nxlog-ce-2.10.2150-1_rhel7.x86_64.rpm

USER nxlog
ENTRYPOINT [ "/usr/bin/nxlog", "-f" ]
CMD [ "-c", "/etc/nxlog.conf" ]
