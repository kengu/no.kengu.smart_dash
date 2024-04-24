SmartDash analytics package  
## Features

* TimeSeries persistence

## Getting started

TODO: List prerequisites and provide or point to information on how to
start using the package.

## Usage

TODO: Include short and useful examples for package users. Add longer examples
to `/example` folder. 

```dart
const like = 'sample';
```

## Developing

Configure development environment (macOS only for now)
```bash
make configure
```

Start automatic code generation with
```bash
make build
```

Analyze Drift files
```bash
dart run drift_dev analyze
```

Identify Drift databases
```bash
dart run drift_dev identify-databases
```

Drift Schema tools
```bash
dart run drift_dev schema dump path/to/databases.dart schema.json
```

Export Drift Schema (prepare for migration)
```bash
make drift-export
```

Generate Drift migration (from exported schema)
```bash
make drift-migration
```

Generate Drift migration tests
```bash
make drift-generate-tests
```