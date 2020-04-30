__init:
	mkdir -p src
	echo -n $(PYENV_VERSION) > .python-version
	pyenv install --skip-existing
	echo 'PYTHONPATH=\\${PWD}/src' > .env
	echo 'VIRTUAL_ENV=\\${PWD}/.venv' >> .env
	echo 'PIPENV_VENV_IN_PROJECT=true' >> .env
	virtualenv -p `pyenv root`/shims/python .venv

__reset:
	-pipenv --rm
	rm -fr Pipfile Pipfile.lock
	rm -fr .python-version
	rm -fr .env

__shell:
	pipenv shell
