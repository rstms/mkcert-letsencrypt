FROM smallstep/step-cli as step
FROM golang:alpine
COPY --from=step /usr/local/bin/step /usr/local/bin/step
RUN apk update && apk add bash less sed openssh python3 py3-pip bash openssh djbdns-common jq
RUN pip install cloudflare
COPY lets-encrypt /usr/local/bin
RUN adduser mkcert </dev/null || true
USER mkcert
WORKDIR /home/mkcert
COPY dot-profile .profile
