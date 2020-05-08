PYENV_VERSION=3.8.2
PROJECT_NAME=myapp
TAG=$(PROJECT_NAME):latest

.PHONY: $(MAKECMDGOALS)

## Create a Docker image
docker:
	pip freeze > src/requirements.txt
	docker build -t $(TAG) .

include Python.mk
