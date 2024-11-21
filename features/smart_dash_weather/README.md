Smart Dash Weather Feature

## Features

* Get weather forecast (any)
* Get weather forecast as device (any)

Implements drivers for following snow state providers
* MET

## Getting started

Add dependency on this package in `pubspec.yaml`

```yaml
dependencies:
  smart_dash_weather: any
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
  integrationManager.register(MetNo.definition, MetNo.register);
    
  // IMPORTANT: Ony build after all integrations are registered 
  integrationManager.build(container);
```

## Usage

This is a minimal example on usage:

```dart
  final service = container.read(weatherServiceProvider);
  final forecasts = await service.getWeather();
```



