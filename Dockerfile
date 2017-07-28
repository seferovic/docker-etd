FROM centos:centos7
Maintainer Identinetics <office@identinetics.com>

# Generic Python 3.4


RUN yum -y update \
 && yum -y install epel-release \
 && yum -y install python34-devel \
 && yum -y install openldap-clients \
 && yum -y install python34-jinja2 \
 && yum -y install less telnet \
 && curl https://bootstrap.pypa.io/get-pip.py | python3.4

ARG BUILD_IP

COPY py-etd/requirements.txt /tmp/requirements.txt
RUN pip3 install -r /tmp/requirements.txt

COPY templates/startup /bin/
RUN chmod a+x /bin/startup

COPY py-etd /opt/bin/
RUN chmod a+x /opt/bin/etd.py

ENV USERNAME=default  \
    CONTAINERUID=1000 \
    CONTAINERGID=1000
RUN groupadd --non-unique -g $CONTAINERGID $USERNAME \
 && useradd  --non-unique --gid $CONTAINERGID --uid $CONTAINERUID $USERNAME

#USER USERNAME

ENTRYPOINT [ "/bin/startup" ]
CMD [ "/opt/bin/etd.py", "etl" ]
