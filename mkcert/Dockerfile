FROM golang:alpine
RUN apk update && apk add bash openssh python3 py3-pip bash openssh djbdns-common jq
RUN pip install cloudflare
COPY lets-encrypt /usr/local/bin
RUN adduser mkcert </dev/null || true
USER mkcert
WORKDIR /home/mkcert
COPY dot-profile .profile
