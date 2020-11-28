current_dir = $(shell pwd)
.DEFAULT_GOAL = build

build:
	docker build -t crizzo/python-test .

start: build
	docker run  crizzo/python-test

start-dev: build
	docker run -it --rm -v $(current_dir)/app:/app/ -v $(current_dir)/nodemon.json:/nodemon.json crizzo/python-test

error:
	echo "no default command specified."
