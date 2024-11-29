Smart Dash Presence Feature

## Features

* Get information about network devices
* Manage presence using network devices 

## Getting started

Add dependency on this package in `pubspec.yaml`

```yaml
dependencies:
  smart_dash_presence: any
```

Next you need to run bootstrap from project root (when used in [smart_dash](https://github.com/kengu/no.kengu.smart_dash)).

```
melos bootstrap
```

Presence service depends on network info service to detect presence. 
For automatic presence detection, do the following

```dart
await ref.read(networkInfoServiceProvider).start();
await ref.read(presenceServiceProvider).start();
```

## Usage

This is a minimal example on usage:

```dart
import 'package:smart_dash_presence/smart_dash_presence.dart';

// Get network devices on local network
Future<List<NetworkDeviceInfo>> getNetworkDevices() {
    final service = ref.read(networkInfoServiceProvider);
    return service.scan();
}

// Get members at home (presence detected)
List<HomeMember> getMembersAtHome() {
  final service = ref.read(presenceServiceProvider);
  return service.membersAtHome;
}

```