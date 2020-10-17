all: build

build:
	docker build -f Dockerfile -t sepastian/voyant .
	docker tag sepastian/voyant sepastian/voyant:2.4.0-M45
	docker tag sepastian/voyant sepastian/voyant:latest
