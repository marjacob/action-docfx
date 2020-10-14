container := docfx
tag := docfx

all: build

.PHONY: build
build:
	docker build --tag $(tag) "$(CURDIR)"

.PHONY: clean
clean:
	docker rm --force $(container)

.PHONY: run
run:
	docker run --name $(container) $(tag)