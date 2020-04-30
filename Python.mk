__init:
	mkdir -p src
	echo -n $(PYENV_VERSION) > .python-version
	pyenv install --skip-existing
	virtualenv -p `pyenv root`/shims/python .venv

__reset:
	-pipenv --rm
	rm -fr Pipfile Pipfile.lock
	rm -fr .python-version
	rm -fr .env

__shell:
	pipenv shell

__requirements:
	pipenv run pip freeze > src/requirements.txt
