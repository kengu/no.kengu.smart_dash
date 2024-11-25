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
Following modules (app, backend, feature or package) have additional development scripts

* [SmartDash App (app)](apps/smart_dash_app/README.md)
* [SmartDash Cloud (backend)](backends/smart_dash_cloud/README.md)
* [SmartDash Daemon (backend)](backends/smart_dash_daemon/README.md)
* [SmartDash Account (feature)](features/smart_dash_account/README.md)
* [SmartDash Geocoder (feature)](features/smart_dash_geocoder/README.md)
* [SmartDash Analytics (feature)](features/smart_dash_analytics/README.md)
* [SmartDash Flow (feature)](features/smart_dash_flow/README.md)
* [SmartDash MQTT (feature)](features/smart_dash_mqtt/README.md)
* [SmartDash Snow (feature)](features/smart_dash_snow/README.md)
* [SmartDash Device (feature)](features/smart_dash_device/README.md)
* [SmartDash Camera (feature)](features/smart_dash_camera/README.md)
* [SmartDash Weather (feature)](features/smart_dash_weather/README.md)
* [SmartDash Notification (feature)](features/smart_dash_notification/README.md)
* [SmartDash Common (package)](packages/smart_dash_common/README.md)
* [SmartDash Datasource (package)](packages/smart_dash_datasource/README.md)
* [SmartDash Integration (package)](packages/smart_dash_integration/README.md)
* [Restoration Web Plugin (package)](packages/restoration_web_plugin/README.md)