# mkcert makefile

build:
	docker build mkcert

run:
	docker run -it --rm --dns=1.1.1.1 -v $$(pwd):/certs --env-file .env mkcert sh -l
