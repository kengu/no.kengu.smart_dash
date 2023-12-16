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
	configure info build serve stop upgrade action

.SILENT: \
	configure info build serve stop upgrade action

configure:
	echo "Configuring developer environment..."
	dart pub global activate pana
	brew install act
	brew install watch
	brew install docker docker-compose
	brew install colima

	mkdir -p ~/.docker/cli-plugins
	ln -sfn $(brew --prefix)/opt/docker-compose/bin/docker-compose ~/.docker/cli-plugins/docker-compose

	brew tap appwrite/sdk-for-cli https://github.com/appwrite/sdk-for-cli
	brew update
	brew install --HEAD appwrite

	colima start

info:
	echo "Analyzing Drift"
	dart run drift_dev analyze

	echo "Listing drift databases"
	dart run drift_dev identify-databases

build:
	echo "Watch for buildable changes..."
	flutter packages pub run build_runner watch --delete-conflicting-outputs

serve:
	echo "Serving AppWrite locally..."
	if command -v colima &> /dev/null; then colima start; fi
	cd lib/backend && docker compose up -d --remove-orphans

stop:
	echo "Stopping AppWrite..."
	cd lib/backend && docker compose stop

upgrade:
	echo "Updating packages..."
	flutter pub upgrade --major-versions

action:
	echo "Running github actions..."
	act