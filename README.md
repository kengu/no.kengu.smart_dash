# Smart Dash

A Smart Dashboard App for my personal use.

# Developing
 
Start automatic code generation with
```bash
make watch
```

Start serving Appwrite backend with 
```bash
make up
```

Stop serving Appwrite backend with
```bash
make stop
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
