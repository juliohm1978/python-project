ARG PYTHON_VERSION

FROM python:${PYTHON_VERSION}

RUN groupadd --system user && useradd --system --gid user user

## add dependencies firset, cached in their own layer
ADD --chown=user:user src/requirements.txt /opt/app/requirements.txt
RUN pip install -r /opt/app/requirements.txt

## add the rest of the application files
ADD --chown=user:user src /opt/app

USER user

ENTRYPOINT [ "/usr/local/bin/python", "/opt/app/main.py" ]
