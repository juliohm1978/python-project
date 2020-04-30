PYENV_VERSION=3.6.10
TAG=myapp:latest

.PHONY: $(MAKECMDGOALS)

## start Visual Studi Code inside the virtual environment
vscode:
	pipenv run code .

## Create a Docker image
docker:
	docker build -t $(TAG) .

include Python.mk
