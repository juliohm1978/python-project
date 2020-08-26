PYENV_VERSION=3.8.3
PROJECT_NAME=myapp
TAG=$(PROJECT_NAME):latest

.PHONY: $(MAKECMDGOALS)

## Create a Docker image
docker:
	pip freeze > src/requirements.txt
	docker build -t $(TAG) \
		--build-arg PYTHON_VERSION=$(PYENV_VERSION) \
		.

run:
	python src/main.py

include Python.mk
