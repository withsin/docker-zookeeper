FROM centos:7
MAINTAINER withsin <withsin@gmail.com>

ENV ZOO_VERSION=3.4.8

RUN yum update -y \
    && yum install -y java-1.8.0-openjdk
RUN curl http://archive.apache.org/dist/zookeeper/zookeeper-${ZOO_VERSION}/zookeeper-${ZOO_VERSION}.tar.gz | tar zx -C /opt \
    && ln -s /opt/zookeeper-${ZOO_VERSION} /opt/zookeeper \
    && mkdir /opt/zookeeper/data \
    && chown -R root:root /opt/zookeeper-${ZOO_VERSION} \
    && mv /opt/zookeeper/conf/zoo_sample.cfg /opt/zookeeper/conf/zoo.cfg
RUN yum clean all

EXPOSE 2181 2888 3888

CMD ["/opt/zookeeper/bin/zkServer.sh", "start-foreground"]
