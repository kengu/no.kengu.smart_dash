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
	build clean-build serve stopupgrade action \
	android-configure android-build android-install android-rebuild \
	macos-bootstrap macos-repair macos-update \

.SILENT: \
	doctor toolchain drift-info drift-export drift-migration drift-generate-tests \
	build clean-build serve stopupgrade action \
	android-configure android-build android-install android-rebuild \
	macos-bootstrap macos-repair macos-update \

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

configure:
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
		brew install carthage
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

		# SystemKit is added to macos as framework for easy access to macos system info using (only needed initially)
		# 1. > carthage update --use-xcframeworks --platform macOS
		# 2. > Drag & Drop macos/Runner.xcworkspace/Carthage/Build/SystemKit.xcframework to XCode > Runner > General > Frameworks, Libraries, and Embedded Content

		# See https://github.com/Carthage/Carthage?tab=readme-ov-file#running-a-project-that-uses-carthage
		carthage bootstrap

		# TROUBLESHOOTING build failures
		# 1. If 'libarclite_macos.a' is missing on your macos machine,
 		#	 --> follow https://stackoverflow.com/a/75924853
 		# OR --> use macos-carthage-repair
 		#
		# 2. If you get error "cannot load module 'SystemKit' built with SDK 'macosx14.2' when using SDK 'macosx13.3'"
		#    --> carthage update --use-xcframeworks --platform macOS
		# OR --> use macos-carthage-update


		colima start
	endif

drift-info:
	echo "Analyzing Drift"
	dart run drift_dev analyze

	echo "Listing drift databases"
	dart run drift_dev identify-databases

drift-export:
	echo "Exporting Drift Schemas"
	dart run drift_dev schema dump \
		lib/feature/analytics/data/drift/time_series_database.dart \
		lib/feature/analytics/data/drift/schemas/
	dart run drift_dev schema dump \
		lib/feature/accounting/data/pricing/drift/electricity_price_database.dart \
		lib/feature/accounting/data/pricing/drift/schemas/

drift-migration:
	echo "Generating Drift Migration"
	dart run drift_dev schema steps \
		lib/feature/analytics/data/drift/schemas/ \
		lib/feature/analytics/data/drift/schemas/versions.dart
#	dart run drift_dev schema steps \
		lib/feature/accounting/data/pricing/drift/schemas/ \
		lib/feature/accounting/data/pricing/drift/schemas/versions.dart

drift-generate-tests:
	echo "Generating Drift Migration Tests"
	dart run drift_dev schema generate --data-classes --companions \
		lib/feature/analytics/data/drift/schemas/ \
		test/feature/analytics/data/drift/

build:
	echo "Watch for buildable changes..."
	dart run build_runner watch --delete-conflicting-outputs

clean-build:
	echo "Clean generated build..."
	dart pub run build_runner clean

android-configure:
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

macos-repair:
	echo "Repairing MacOSX setup..."
	if [ -f  "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/arc/README.md" ]; \
	then echo "  [✓] Libarclite files found."; \
	else \
	  echo >&2 "  [x] Libarclite files NOT found > fixing..."; \
	  cd /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/; \
	  sudo mkdir arc && cd arc; \
	  sudo git clone https://github.com/kamyarelyasi/Libarclite-Files.git .; \
	  sudo chmod +x *; \
	  echo "  [✓] Libarclite files added."; \
	fi; \
	echo "Repairing MacOSX setup...DONE"


macos-update:
	echo "Updating MacOSX setup"; \
	cd macos; \
	pod update; \
	cd Runner.xcworkspace; \
	carthage update --use-xcframeworks --platform macOS; \

macos-bootstrap:
	echo "Bootstrapping MacOSX setup"; \
	cd macos; \
	pod update; \
	cd Runner.xcworkspace; \
	carthage bootstrap --use-xcframeworks --platform macOS; \

upgrade:
	echo "Updating packages..."
	flutter pub upgrade --major-versions

action:
	echo "Running github actions..."
	act