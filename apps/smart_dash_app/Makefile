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
	doctor configure drift-info \
	build watch clean-build serve stop upgrade action \
	android-configure android-build android-install android-rebuild \
	macos-bootstrap macos-repair macos-update test \

.SILENT: \
	doctor toolchain drift-info \
	build watch clean-build serve stop upgrade action \
	android-configure android-build android-install android-rebuild \
	macos-bootstrap macos-repair macos-update test \

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
	@echo "Configuring developer environment..."
	@echo "$(OSNAME) detected"

ifeq ($(OSNAME),WIN32)
	@echo "TODO: [!] Install dependencies"
else ifeq ($(OSNAME),LINUX)
	@echo "TODO: [!] Install dependencies"
else ifeq ($(OSNAME),OSX)
	@echo "Installing dependencies..."
	@dart global activate pana
	@brew install act watch carthage docker docker-compose colima

	@command -v bundletool >/dev/null 2>&1 || (echo "[!] Installing bundletool" && brew install bundletool)
	@command -v bundletool >/dev/null 2>&1 && echo "[✓] bundletool is installed."

	@command -v bundle >/dev/null 2>&1 || (echo "[!] Installing bundler" && sudo gem install bundler)
	@command -v bundle >/dev/null 2>&1 && echo "[✓] bundler is installed."

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

build:
	echo "Run code generation..."
	dart run build_runner build --delete-conflicting-outputs

watch:
	echo "Watch for buildable changes..."
	dart run build_runner watch --delete-conflicting-outputs

clean-build:
	echo "Clean generated build..."
	dart run build_runner clean

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
	# SystemKit is added to macos as framework for easy access to macos system info using (only needed initially)
	# 1. > carthage update --use-xcframeworks --platform macOS
	# 2. > Drag & Drop macos/Runner.xcworkspace/Carthage/Build/SystemKit.xcframework to XCode > Runner > General > Frameworks, Libraries, and Embedded Content

	# See https://github.com/Carthage/Carthage?tab=readme-ov-file#running-a-project-that-uses-carthage
	# > cd macos carthage bootstrap

	# TROUBLESHOOTING build failures
	# 1. If 'libarclite_macos.a' is missing on your macos machine,
	#	 --> follow https://stackoverflow.com/a/75924853
	# OR --> use macos-carthage-repair
	#
	# 2. If you get error "cannot load module 'SystemKit' built with SDK 'macosx14.2' when using SDK 'macosx13.3'"
	#    --> carthage update --use-xcframeworks --platform macOS
	# OR --> use macos-carthage-update

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

test:
	@if [ -d test ] && ls test/* > /dev/null 2>&1; then \
	  echo "Running tests in $(pwd)"; \
	  flutter test; \
	else \
	  echo "Skipping $(pwd) - no tests found."; \
	fi