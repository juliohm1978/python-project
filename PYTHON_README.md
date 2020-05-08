# Environment setup

This is a skeleton that combines `pyenv` and `virtualenv` to create a Python development environment. It can be used to start a new project quickly.

## Dependencies

Make sure dependencies are installed.

    sudo apt-get install -y make python3 python3-pip build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev xz-utils tk-dev libffi-dev liblzma-dev python-openssl git

Install `virtualenv` packages using `pip`.

    pip3 install --user virtualenv

Install `pyenv` using the official installer: <https://github.com/pyenv/pyenv-installer>

    ## remove a previous installation
    rm -fr ~/.pyenv

    ## install the most recent
    curl -L https://github.com/pyenv/pyenv-installer/raw/master/bin/pyenv-installer | bash

Configure your shell to use `pyenv`:

    ## for Bash
    pyenv init >> $HOME/.bash_profile

    ## for Fish
    pyenv init >> $HOME/.config/fish/config.fish

If the `pyenv` binary cannot be found, add `$HOME/.pyenv/bin` to you `$PATH`.

Install `pyenv virtualenv` plugin using the official installer: <https://github.com/pyenv/pyenv-virtualenv>

    git clone https://github.com/pyenv/pyenv-virtualenv.git $(pyenv root)/plugins/pyenv-virtualenv

Configure your shell to use the plugin:

    ## for Bash
    pyenv virtualenv-init >> $HOME/.bash_profile

    ## for Fish
    pyenv virtualenv-init >> $HOME/.config/fish/config.fish

## Initialize the project environment

Edit the provided `Makefile` and define the preferred Python version to use in `PYENV_VERSION`.

Further `make` targets for your project can also be defined in `Makefile`, replacing the example targets. The include directive for `Python.mk` will be used mostly to initialize and reset the python environment.

    make __init

This will create a virtual Python environment with the specified version along most settings, such as `Pipfile`. The virtual environment will live inside `.venv` directory, along with your project. This directory can be ignored by your VCS, since it can be recreated with `make __init`.

The source code for your project is expected to reside in `src`.

You can start a bash shell into the virtual environment using the `__shell` target.

    make __shell

## In-project depdendencies

Inside the environment, `pip` can be used normally to install or remove dependencies.

    pip install <pkg>

## Reset the environment

You can delete the virtual environment using:

    make __reset

Once the environment is deleted, you can recreate it using `make __init`.

## Create a Docker image

The `docker` target creates a `requirements.txt` from the currently installed packages and uses that to create a Docker image.

    make docker
