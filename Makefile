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
	doctor toolchain configure info build serve stop upgrade action android-build android-install android-rebuild

.SILENT: \
	doctor toolchain configure info build serve stop upgrade action android-build android-install android-rebuild

doctor:
	echo "Doctor summary"
ifeq ($(OSNAME),WIN32)
	echo "Windows detected"
	echo "TODO: [!] Check if https://github.com/google/bundletool is installed"
	echo "TODO: [!] Check if https://docs.fastlane.tools is installed"
	echo "TODO: [!] Check if https://bundler.io is installed"
else
	echo "$(OSNAME) detected, checking dependencies..."
	if hash bundletool 2>/dev/null; \
		then echo "[✓] bundletool is installed."; \
		else echo >&2 "[x] bundletool is NOT installed."; fi

endif
	echo "Android, checking configuration..."; \
	if [ -f  "android/key.properties" ]; \
		then echo "[✓] Signing properties found."; \
		else echo >&2 "[x] Signing properties NOT found > run 'make configure'"; fi; \
	if [ -f $(storeFile) ]; \
		then echo "[✓] Upload key $(storeFile) found."; \
		else echo >&2 "[x] Upload key $(storeFile) NOT found > run 'make configure'"; fi; \

toolchain:
	echo "Configuring developer environment..."
	echo "$(OSNAME) detected"

	ifeq ($(OSNAME),WIN32)
		echo "TODO: [!] Install dependencies"
	else ifeq ($(OSNAME),LINUX)
		echo "TODO: [!] Install dependencies"
	else ifeq ($(OSNAME),OSX)
		echo "Installing dependencies..."
		dart pub global activate pana
		brew install act
		brew install watch
		brew install docker docker-compose
		brew install colima

		if hash bundletool 2>/dev/null; \
			then echo "[✓] bundletool is installed."; \
			else echo "[!] Installing bundletool"; brew install bundletool; fi
		if hash bundle 2>/dev/null; \
			then echo "[✓] bundler is installed."; \
			else echo "[!] Installing bundler"; sudo gem install bundler; fi

		mkdir -p ~/.docker/cli-plugins
		ln -sfn $(brew --prefix)/opt/docker-compose/bin/docker-compose ~/.docker/cli-plugins/docker-compose

		dart pub global activate serverpod_cli

		colima start
	endif

configure:
	echo "Initialize Android configuration..."; \
	read -p "> Enter path to upload key: " path; \
	if [ -f $$path ]; then \
		read -p "> Enter upload keystore password: " pwd; \
		echo "storePassword=$$pwd" > android/key.properties; \
		echo "keyPassword=$$pwd" >> android/key.properties; \
		echo "keyAlias=upload" >> android/key.properties; \
		echo "storeFile=$$path" >> android/key.properties; \
		echo "> Initializing fastlane..."; cd android; fastlane init; \
		echp "[✓] Android configuration complete.";
	else; \
		echo "[x] Android upload key $$path NOT FOUND, Skipping."; \
	fi;

info:
	echo "Analyzing Drift"
	dart run drift_dev analyze

	echo "Listing drift databases"
	dart run drift_dev identify-databases

build:
	echo "Watch for buildable changes..."
	dart pub run build_runner watch --delete-conflicting-outputs

android-rebuild:
	echo "Rebuilding android project..."
	cd android && ./gradlew clean build

android-build:
	echo "Building Android APK set archive..."; \
	flutter build appbundle
	echo "[✓] Flutter build for Android complete."

android-install:
	bundletool build-apks \
		--bundle=build/app/outputs/bundle/release/app-release.aab \
		--output=build/app/outputs/smartdash.apks \
		--overwrite; \
	echo "Deploy to connected android devices"; \
	adb devices; \
	read -p "> Select device id: " id; \
	bundletool install-apks --apks=build/app/outputs/smartdash.apks --device-id $$id;

serve:
	echo "Serving Serverpod locally..."
	if command -v colima &> /dev/null; then colima start; fi
	#cd lib/backend && docker compose up -d --remove-orphans

stop:
	echo "Stopping Serverpod locally..."
	#cd lib/backend && docker compose stop

upgrade:
	echo "Updating packages..."
	flutter pub upgrade --major-versions

action:
	echo "Running github actions..."
	act