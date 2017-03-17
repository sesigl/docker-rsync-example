FROM centos:latest

# install rsync
RUN yum update -y && yum -y install rsync

# copy the rsync config
COPY ./rsyncd.conf /etc/

# create the dir that will be synced
RUN mkdir /home/share

# start the service automatically
#RUN systemctl start rsyncd
#RUN systemctl enable rsyncd

# just to keep the container running
ENTRYPOINT tail -f /dev/null
