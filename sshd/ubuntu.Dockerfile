FROM ubuntu:22.04

RUN apt-get update && apt-get install -y openssh-server && mkdir /var/run/sshd

RUN echo 'root:$6$deUegwkHU4fpzcnF$omBwqeKcW53tyObLg9tMSpSNYdA/k8uulTySL1j2lppB6owoe5oYtRYgugJjwqPzmLG7yMSSC960vLVjQ3qMR0' | chpasswd --encrypted

RUN sed -ri 's/^#?PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config

RUN mkdir /root/.ssh

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]
