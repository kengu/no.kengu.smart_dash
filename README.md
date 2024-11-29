# Smart Dash Project 

[![Publish](https://github.com/kengu/no.kengu.smart_dash/actions/workflows/publish.yml/badge.svg)](https://github.com/kengu/no.kengu.smart_dash/actions/workflows/publish.yml)

A Smart Dashboard project for my personal use.

# Developing

This project is organized as a mono-repo using [Melos](https://pub.dev/packages/melos).

Bootstrap monorepo management tool (only needed once)
```bash
dart pub global activate melos
```

Prepare development environment (macOS only for now)
```bash
melos run prepare
```

Run each time you add or remove a feature or package
```bash
melos bootstrap
```

Upgrade all dependencies at once
```bash
melos run upgrade
```

# Modules
The project is organized using modules. 

[Apps](#apps) are top-level frontend modules that uses 
lower level modules to build functionality into graphical user interfaces. 

[Backends](#backends) are modules that uses lower level modules to build APIs that top-level 
modules need to implement business logic and data persistence. 

[Features](#features) are modules that implements a vertical slice of business logic in 
[apps](#apps) and [backends](#backends). Integrations with third party services are typically 
implemented in the backend following the [bff pattern](https://bff-patterns.com/).

[Packages](#packages) are low-level modules that implement functionality that
higher level modules need.


## Apps
* [SmartDash App (app)](apps/smart_dash_app/README.md)

## Backends
* [SmartDash Cloud (backend)](backends/smart_dash_cloud/README.md)
* [SmartDash Daemon (backend)](backends/smart_dash_daemon/README.md)

## Features
* [SmartDash Account (feature)](features/smart_dash_account/README.md)
* [SmartDash Geocoder (feature)](features/smart_dash_geocoder/README.md)
* [SmartDash Analytics (feature)](features/smart_dash_analytics/README.md)
* [SmartDash Flow (feature)](features/smart_dash_flow/README.md)
* [SmartDash MQTT (feature)](features/smart_dash_mqtt/README.md)
* [SmartDash Snow (feature)](features/smart_dash_snow/README.md)
* [SmartDash Energy (feature)](features/smart_dash_energy/README.md)
* [SmartDash Device (feature)](features/smart_dash_device/README.md)
* [SmartDash Camera (feature)](features/smart_dash_camera/README.md)
* [SmartDash Weather (feature)](features/smart_dash_weather/README.md)
* [SmartDash Notification (feature)](features/smart_dash_notification/README.md)

## Packages
* [SmartDash Common (package)](packages/smart_dash_common/README.md)
* [SmartDash Datasource (package)](packages/smart_dash_datasource/README.md)
* [SmartDash Integration (package)](packages/smart_dash_integration/README.md)
* [Restoration Web Plugin (package)](packages/restoration_web_plugin/README.md)