all: build

build:
	docker build -f Dockerfile -t sepastian/voyant .
	docker tag sepastian/voyant sepastian/voyant:2.2.0-M2
	docker tag sepastian/voyant sepastian/voyant:latest
