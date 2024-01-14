# Smart Dash

A Smart Dashboard App for my personal use.

## Roadmap

 - [ ] Read and save historical data from the weather station
 - [x] Integrate webcam for easy viewing in one place
 - [ ] Implement support for Sikom buttons (and astro clocks)
 - [ ] Implement support for Sikom thermostats
 - [ ] Implement support for Sikom power controller
 - [ ] Implement support for editable control flows
 - [ ] Implement support for geocoder for address and reverse lookup
 - [ ] Making a button that turns on/off "the whole cabin" (at home / away from home) 
 - [ ] Implement display of indoor temperature per room with graphs
 - [ ] Implement alarms as notifications and detail views
 

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
