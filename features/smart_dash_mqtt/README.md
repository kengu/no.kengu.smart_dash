Smart Dash Weather Feature

## Features

* Fetch MQTT messages 

## Getting started

Add dependency on this package in `pubspec.yaml`

```yaml
dependencies:
  smart_dash_mqtt: any
```

You need to run bootstrap from project root (when used in [smart_dash](https://github.com/kengu/no.kengu.smart_dash))

```
melos bootstrap
```

The last step is to register supported weather forecast:

```dart
  final container = ProviderContainer();
  final integrationManager = container.read(integrationManagerProvider);

  // Initialize camera integrations
  integrationManager.register(Mqtt.definition, Mqtt.register);
    
  // IMPORTANT: Ony build after all integrations are registered 
  integrationManager.build(container);
```

## Usage

This is a minimal example on usage:

```dart
  final service = container.read(mqttServiceProvider);
  final subscription = service.listen(...);
  ...
  subscription.cancel();
```



