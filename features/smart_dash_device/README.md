Smart Dash Device Feature

## Features

* Get devices
* Pair devices with home
* Unpair devices from home
* Update devices (if supported)

Implements drivers for following device
* Snow
* Sikom
* Foscam
* Weather

## Getting started

Add dependency on this package in `pubspec.yaml`

```yaml
dependencies:
  smart_dash_device: any
```

You need to run bootstrap from project root (when used in [smart_dash](https://github.com/kengu/no.kengu.smart_dash))

```
melos bootstrap
```

The last step is to register supported services:

```dart
  final container = ProviderContainer();
  final integrationManager = container.read(integrationManagerProvider);

  // Initialize camera integrations
  integrationManager
    ..register(Sikom.definition, Sikom.register)
    ..register(Camera.definition, Sikom.register);
    
  // IMPORTANT: Ony build after all integrations are registered 
  integrationManager.build(container);
```

## Usage

This is a minimal example on usage:

```dart
  final service = container.read(deviceServiceProvider);
  final config = service.configs.first;
  final device = await service.getDevices(config);
```



