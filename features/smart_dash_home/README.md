Smart Dash Weather Feature

## Features

* Manage home members
* Manage integrations
* Manage service configurations

## Getting started

Add dependency on this package in `pubspec.yaml`

```yaml
dependencies:
  smart_dash_home: any
```

You need to run bootstrap from project root (when used in [smart_dash](https://github.com/kengu/no.kengu.smart_dash))

```
melos bootstrap
```

## Usage

This is a minimal example on usage:

```dart
  final service = container.read(homeServiceProvider);
  final results = service.listen(...);
  ...
  subscription.cancel();
```



