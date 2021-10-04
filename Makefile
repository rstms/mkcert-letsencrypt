# mkcert makefile


build:
	docker build -t mkcert mkcert

rebuild:
	docker build -t mkcert --no-cache mkcert

CFG_FILE=~/.mkcert
KEY_FILE=$(shell awk <${CFG_FILE} -F= '/^GATEWAY_KEY_FILE/{print $$2}')
GATEWAY_KEY=$(shell base64 -w0 <${KEY_FILE})
VOL_ARGS=-v $(shell pwd):/certs
ENV_ARGS=--env-file ~/.mkcert -e GATEWAY_KEY=${GATEWAY_KEY}
RUN=docker run -it --rm --dns=1.1.1.1 ${VOL_ARGS} ${ENV_ARGS} mkcert

test:
	${RUN} bash -l -c 'env STAGING=1 lets-encrypt vss.rstms.net 10.1.2.1'

vss:
	${RUN} bash -l -c 'env lets-encrypt vss.rstms.net 10.1.2.1'

shell:
	${RUN} bash -l

install: build
	sudo cp script/mkcert /usr/local/bin

