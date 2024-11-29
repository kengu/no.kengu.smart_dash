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

# Utility functions
storeFile = "$$(grep "storeFile" android/key.properties | cut -d'=' -f2)"
storePassword = "$$(grep "storePassword" android/key.properties | cut -d'=' -f2)"

.PHONY: \
	doctor configure drift-info drift-export drift-migration drift-generate-tests \
	build clean-build upgrade \

.SILENT: \
	doctor configure drift-info drift-export drift-migration drift-generate-tests \
	build clean-build upgrade \

doctor:
	echo "Doctor summary"
ifeq ($(OSNAME),WIN32)
	echo "Windows detected"
	echo "TODO: [!] Check if https://github.com/google/bundletool is installed"
	echo "TODO: [!] Check if https://docs.fastlane.tools is installed"
	echo "TODO: [!] Check if https://bundler.io is installed"
else
	# TODO
	# echo "$(OSNAME) detected, checking dependencies..."
endif

configure:
	@echo "Configuring developer environment..."
	@echo "$(OSNAME) detected"

ifeq ($(OSNAME),WIN32)
	@echo "TODO: [!] Install dependencies"
else ifeq ($(OSNAME),LINUX)
	@echo "TODO: [!] Install dependencies"
else ifeq ($(OSNAME),OSX)
	@echo "Installing dependencies..."
	@dart pub global activate pana
	@brew install act watch carthage docker docker-compose colima

	@mkdir -p ~/.docker/cli-plugins
	@ln -sfn $(shell brew --prefix)/opt/docker-compose/bin/docker-compose ~/.docker/cli-plugins/docker-compose

	# The following command to start colima is commented out. Uncomment if necessary.
	#@colima start

endif

drift-info:
	echo "Analyzing Drift"
	dart run drift_dev analyze

	echo "Listing drift databases"
	dart run drift_dev identify-databases

drift-export:
	echo "Exporting Drift Schemas"
	dart run drift_dev schema dump \
		lib/src/data/pricing/drift/electricity_price_database.dart \
		lib/src/data/pricing/drift/schemas/

drift-migration:
	echo "Generating Drift Migration"
	dart run drift_dev schema steps \
		lib/src/data/pricing/drift/schemas/ \
		lib/src/data/pricing/drift/schemas/versions.dart

drift-generate-tests:
	echo "Generating Drift Migration Tests"
	dart run drift_dev schema generate --data-classes --companions \
		lib/src/data/drift/schemas/ \
		test/src/data/drift/

build:
	echo "Watch for buildable changes..."
	dart run build_runner watch --delete-conflicting-outputs

clean-build:
	echo "Clean generated build..."
	dart pub run build_runner clean