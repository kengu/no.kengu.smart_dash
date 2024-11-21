Smart Dash Snow Feature

## Features

* Get snow as state (any)
* Get snow state as device (any)

Implements drivers for following snow state providers
* NySny

## Getting started

Add dependency on this package in `pubspec.yaml`

```yaml
dependencies:
  smart_dash_snow: any
```

You need to run bootstrap from project root (when used in [smart_dash](https://github.com/kengu/no.kengu.smart_dash))

```
melos bootstrap
```

The last step is to register supported snow states:

```dart
  final container = ProviderContainer();
  final integrationManager = container.read(integrationManagerProvider);

  // Initialize camera integrations
  integrationManager.register(NySny.definition, NySny.register);
    
  // IMPORTANT: Ony build after all integrations are registered 
  integrationManager.build(container);
```

## Usage

This is a minimal example on usage:

```dart
  final service = container.read(snowServiceProvider);
  final states = await service.getStates();
```



