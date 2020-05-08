__init:
	mkdir -p src
	echo -n $(PYENV_VERSION) > .python-version
	pyenv install --skip-existing
	pyenv virtualenv $(PROJECT_NAME)

__reset:
	pyenv virtualenv-delete $(PROJECT_NAME)
	rm -fr .python-version

__shell:
	source `pyenv root`/versions/$(PROJECT_NAME)/bin/activate && bash
