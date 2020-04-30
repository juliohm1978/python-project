# Environment setup

This is a skeleton that combines `pyenv`, `pipenv` and `virtualenv` to create a Python development environment. It can be used to start a new project quickly.

## Dependencies

Make sure dependencies are installed.

    sudo apt-get install -y make python3 python3-pip build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev xz-utils tk-dev libffi-dev liblzma-dev python-openssl git

Install `pipenv` and `virtualenv` packages using `pip`.

    pip3 install --user pipenv virtualenv

Install `pyenv` using the official installer: <https://github.com/pyenv/pyenv-installer>

    ## remove a previous installation
    rm -fr ~/.pyenv

    ## install the most recent
    curl -L https://github.com/pyenv/pyenv-installer/raw/master/bin/pyenv-installer | bash

Configure your shell to use `pyenv` correctly.

For bash:

    ## append to ~/.bash_profile
    eval "$(pyenv init -)"

For fish:

    ## append to ~/.config/fish/config.fish
    status --is-interactive; and source (pyenv init -|psub)

You can acquire the updated version of those shell settings calling `pyenv init` from within your shell.

If the `pyenv` binary cannot be found, add `$HOME/.pyenv/bin` to you `$PATH`.

## Initialize the project environment

Edit the provided `Makefile` and define the preferred Python version to use in `PYENV_VERSION`.

Further `make` targets for your project can also be defined here, replacing the dummy `hello` target. The include directive for `Python.mk` will be used mostly in rare cases. Once to initialize the environment and perhaps to reset the entire project environment.

    make __init

This will create a virtual Python environment with the specified version along most settings, such as `Pipfile`. The virtual environment will live inside `.venv` directory, along with your project. This directory can be ignored by your VCS, since it can be recreated with `make __init`.

The source code for your project is expected to reside in `src`.

You can start a shell into the virtual environment by using `pipenv` as usual.

    pipenv shell

## In-project depdendencies

While working in your project inside the virtual environment, you can install dependencies with `pipenv` to keep them managed.

    pipenv install <dependency_name>

Once you have all dependencies installed and updated, you can lock them and create `requirements.txt` using:

    make __requirements
    
The example `Dockerfile` uses that `requirements.txt` to install the dependencies inside the image.

## Reset the environment

You can delete the virtual environment using:

    make __reset
    
    ## Recreate the environment
    make __init

This will not delete `Pipfile` and `Pipfile.lock` from your project.

To delete EVERYTHING related to the virtual environment, including `Pipfile` and `Pipfile.lock`, you can:

    make __hardreset
