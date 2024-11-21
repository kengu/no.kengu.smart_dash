Smart Dash Camera Feature

## Features

* Get snapshots (any )
* Get live video (RTSP only)
* Control motion detection (if camera supports it)

Implements drivers for following Cameras
* Foscam

## Getting started

Add dependency on this package in `pubspec.yaml` 

```yaml
dependencies:
  smart_dash_camera: any
```

You need to run bootstrap from project root (when used in [smart_dash](https://github.com/kengu/no.kengu.smart_dash))

```
melos bootstrap
```

The last step is to register supported cameras:

```dart
  final container = ProviderContainer();
  final integrationManager = container.read(integrationManagerProvider);

  // Initialize camera integrations
  integrationManager.register(Foscam.definition, Foscam.register);
    
  // IMPORTANT: Ony build after all integrations are registered 
  integrationManager.build(container);
```

## Usage

This is a minimal example on usage:

```dart
  final service = container.read(cameraServiceProvider);
  final config = service.configs.first;
  final camera = await service.getCamera(config);
  final snapshot = service.getSnapshot(camera);
```



