# Default host IP
HOST = 0.0.0.0

# Detect operating system in Makefile.
ifeq ($(OS),Windows_NT)
	OSNAME = WIN32
else
	UNAME_S := $(shell uname -s)
	ifeq ($(UNAME_S),Linux)
		OSNAME = LINUX
	endif
	ifeq ($(UNAME_S),Darwin)
		OSNAME = OSX
		# Mac OSX workaround
		HOST = host.docker.internal
	endif
endif

.PHONY: \
	build clean-build test

.SILENT: \
	build clean-build test

test:
	@if [ -d test ] && ls test/*.dart > /dev/null 2>&1; then \
	  echo "Running tests in $(pwd)"; \
	  flutter test; \
	else \
	  echo "Skipping $(pwd) - no tests found."; \
	fi