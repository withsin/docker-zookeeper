FROM centos:7
MAINTAINER withsin <withsin@gmail.com>

RUN yum update -y
RUN yum install -y java-1.8.0-openjdk
RUN curl http://archive.apache.org/dist/zookeeper/zookeeper-3.4.7/zookeeper-3.4.7.tar.gz | tar zx -C /opt
RUN ln -s /opt/zookeeper-3.4.7 /opt/zookeeper
RUN mkdir /opt/zookeeper/data
RUN chown -R root:root /opt/zookeeper-3.4.7
RUN mv /opt/zookeeper/conf/zoo_sample.cfg /opt/zookeeper/conf/zoo.cfg
RUN yum clean all

EXPOSE 2181 2888 3888

CMD ["/opt/zookeeper/bin/zkServer.sh", "start-foreground"]
