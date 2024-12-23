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
	build clean-build drift-info drift-export drift-migration drift-generate-tests test

.SILENT: \
	build clean-build drift-info drift-export drift-migration drift-generate-tests test

build:
	echo "Watch for buildable changes..."
	dart run build_runner watch --delete-conflicting-outputs

drift-info:
	echo "Analyzing Drift"
	dart run drift_dev analyze

	echo "Listing drift databases"
	dart run drift_dev identify-databases

drift-export:
	echo "Exporting Drift Schemas"
	dart run drift_dev schema dump \
		lib/src/account/data/drift/account_database.dart \
		lib/src/account/data/drift/schemas/

drift-migration:
	echo "Generating Drift Migration"
	dart run drift_dev schema steps \
		lib/src/account/data/drift/schemas/ \
		lib/src/account/schemas/versions.dart

drift-generate-tests:
	echo "Generating Drift Migration Tests"
	dart run drift_dev schema generate --data-classes --companions \
		lib/src/account/data/drift/schemas/ \
		test/account/data/drift/

clean-build:
	echo "Clean generated build..."
	dart pub run build_runner clean

test:
	@if [ -d test ] && ls test/*.dart > /dev/null 2>&1; then \
	  echo "Running tests in $(pwd)"; \
	  flutter test; \
	else \
	  echo "Skipping $(pwd) - no tests found."; \
	fi