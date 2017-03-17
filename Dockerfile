FROM centos:6

# install rsync
RUN yum update -y
RUN yum -y install rsync xinetd

ADD ./rsyncd.conf /root/
RUN sed -i 's/disable[[:space:]]*=[[:space:]]*yes/disable = no/g' /etc/xinetd.d/rsync # enable rsync
RUN cp /root/rsyncd.conf /etc/rsyncd.conf # setup git folder for sync and allow all clients

RUN /etc/rc.d/init.d/xinetd start
RUN chkconfig xinetd on

# create the dir that will be synced
RUN mkdir /home/share

# just to keep the container running
CMD /etc/rc.d/init.d/xinetd start && tail -f /dev/null
