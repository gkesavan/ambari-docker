FROM centos:7.2.1511
RUN curl -o /etc/yum.repos.d/ambari.repo http://public-repo-1.hortonworks.com/ambari/centos7/2.x/updates/2.5.0.3/ambari.repo && \
curl -o /etc/yum.repos.d/HDP.repo http://public-repo-1.hortonworks.com/HDP/centos7/2.x/updates/2.5.5.0/hdp.repo
RUN yum install java-1.8.0-openjdk-devel.x86_64 krb5-workstation\* mysql mysql-connector-java --nogpgcheck -y
RUN yum install ansible openssh-server passwd sudo unzip extjs rpcbind snappy snappy-devel --nogpgcheck -y
RUN yum install zookeeper\* ambari\* hadoop\* hbase\* oozie\* spark\* flume\* sqoop\* phoenix\*  --nogpgcheck -y
RUN yum install httpfs\* ranger\* hive\* pig\* datafu\* zeppelin\* slider\* -y --nogpgcheck ; yum clean all
RUN mkdir -p /var/run/sshd /root/.ssh ; ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key -N ''; localedef -i en_US -f UTF-8 en_US.UTF-8
EXPOSE 22
ENTRYPOINT ["/usr/sbin/sshd", "-D"]
