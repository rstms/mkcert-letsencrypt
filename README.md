mkcert
------

CLI tool for making Let's Encrypt SSL/TLS certificates

### Requirements for operation

- shell account on a `gateway` machine with the following attributes:
  - Internet connection
  - TCP port 80 unused
  - docker
- cloudflare DNS with api token

### Mechanism
run transient docker container
update the cloudflare DNS to return GATEWAY's IP address for FQDN
make ssh connection to GATEWAY, forward remote port 80 to local port 80
ssh to gateway, doing DNS lookups for FQDN until GATEWAY IP is returned
use local step-cli command line to request cert from lets-encrypt acme server
delete cloudflare DNS A record for FQDN
(optional) update cloudflare DNS A record for FQDN to return HOST_IP


### References

- https://blog.cloudflare.com/python-cloudflare/
- https://hub.docker.com/r/smallstep/step-cli
- https://api.cloudflare.com/
