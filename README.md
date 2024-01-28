# Smart Dash

A Smart Dashboard App for my personal use.

## Roadmap

- [ ] Read and save historical data from the weather station
- [x] Integrate webcam for easy viewing in one place
- [x] Implement support for Sikom buttons (and astro switch)
- [x] Implement support for Sikom thermostats
- [x] Implement support for Sikom power controller
- [ ] Implement support for editable control flows
- [ ] Implement support for geocoder for address and reverse lookup
- [ ] Making a button that turns on/off "the whole cabin" (at home / away from home) 
- [ ] Implement display of indoor temperature per room with graphs
- [ ] Implement alarms as notifications and detail views
 
## Experiments and ideas to explore

- Refactor refresh of camera information and snapshot using timing service and streams
- Use package [image_compare](https://pub.dev/packages/image_compare) to detect movement locally by inspection of snapshot streams
- Use package [zwave](https://pub.dev/packages/zwave) on rpi4 to read from
  [z-wave 3-phase power meter](https://www.eldirekte.no/aeotec-strom-maler-3fas-60a-z-wave/cat-p/c/p10637336)


# Developing

Configure development environment (MacOS only for now)
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


