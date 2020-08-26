__init:
	mkdir -p src
	echo -n $(PYENV_VERSION) > .python-version
	pyenv install --skip-existing
	pyenv virtualenv -f $(PROJECT_NAME)

__reset:
	pyenv virtualenv-delete $(PROJECT_NAME)
	rm -fr .python-version

__shell:
	PROJECT_NAME=$(PROJECT_NAME) bash --rcfile .bashrc

__fish:
	fish -C 'pyenv activate myapp'
