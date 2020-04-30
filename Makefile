PYENV_VERSION=3.6.10

.PHONY: $(MAKECMDGOALS)

hello:
	@echo
	@echo Run \`make __init\` to create a virutal environment.
	@echo

include Python.mk
