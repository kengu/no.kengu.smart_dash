Smart Dash Energy Feature

## Features

* Get energy consumption
* Get electricity prizes
* Get energy bill from energy consumption

## Getting started

Add dependency on this package in `pubspec.yaml`

```yaml
dependencies:
  smart_dash_energy: any
```

You need to run bootstrap from project root (when used in [smart_dash](https://github.com/kengu/no.kengu.smart_dash)) before you can import this feature.

```
melos bootstrap
```


## Usage

This is a minimal example on usage:

```dart
import 'package:smart_dash_energy/smart_dash_energy.dart';

Future<List<ElectricityPrice>> getPriceHourly() {
    final service = ref.watch(electricityPriceServiceProvider);
    return service.getPriceHourly('NO1', DateTime.now());
}
```