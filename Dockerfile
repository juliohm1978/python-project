FROM docker.tjpr.net/python:3.6.10-buster

RUN groupadd --system user && useradd --system --gid user user

ADD --chown=user:user src/requirements.txt /opt/requirements.txt

RUN pip install -r /opt/requirements.txt

ADD --chown=user:user src /opt/

USER user

ENTRYPOINT [ "/opt/myapp.py" ]
