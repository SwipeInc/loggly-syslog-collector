FROM debian:9.3

LABEL maintainer="Rei Smit <reimertsmit@gmail.com>"
LABEL description="Centralised syslog collector, piping results to Loggly. Supervisord used for process monitoring"
LABEL repo="https://github.com/reimert/loggly-syslog-collector"
LABEL version="1.0.1"

# OS Updates
RUN apt update && \
  apt install -y rsyslog-gnutls supervisor curl net-tools tcpdump gnutls-bin

# Supervisor Configuration
COPY ./configs/supervisord.conf /usr/local/etc/

# RSyslog Configuration
RUN mkdir -p /var/spool/rsyslog
RUN mkdir -pv /etc/rsyslog.d/keys/ca.d
WORKDIR /etc/rsyslog.d/keys/ca.d
RUN curl -O https://logdog.loggly.com/media/logs-01.loggly.com_sha12.crt
COPY ./configs/rsyslog-loggly.conf /etc/rsyslog.conf
RUN ln -sf /dev/stdout /var/log/rsyslog.log && ln -sf /dev/stdout /var/log/rsyslog-error.log

# Start Script
COPY ./configs/run.sh /usr/local/bin/
RUN chmod 775 /usr/local/bin/run.sh

# Change Workdir
WORKDIR /var/tmp

# Expose Ports
EXPOSE 514/udp

# Container Start
CMD ["/usr/local/bin/run.sh"]

