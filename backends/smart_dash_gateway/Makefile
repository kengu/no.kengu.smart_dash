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
	build clean-build serve test

.SILENT: \
	build clean-build serve test

build:
	echo "Watch for buildable changes..."
	dart run build_runner watch --delete-conflicting-outputs

clean-build:
	echo "Clean generated build..."
	dart pub run build_runner clean

serve:
	dart run

test:
	@if [ -d test ] && ls test/*.dart > /dev/null 2>&1; then \
	  echo "Running tests in $(pwd)"; \
	  flutter test; \
	else \
	  echo "Skipping $(pwd) - no tests found."; \
	fi