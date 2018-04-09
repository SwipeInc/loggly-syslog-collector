Syslog collector posting to Loggly using rsyslog and supervisor for process control.
===
`1.0.1`,`latest` (Rebuilt image to pull latest Loggly TLS certificate)

**Usage**
```docker run -d -e LOGGLY_TOKEN=YOUR_LOGGLY_TOKEN -e LOGGLY_TAG=YOUR_LOGGLY_TAG -p 514:514/udp reimert/loggly-docker:latest```
