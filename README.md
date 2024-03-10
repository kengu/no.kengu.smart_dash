# Smart Dash

A Smart Dashboard App for my personal use.

## Roadmap

- [ ] Implement pane-based settings screen on desktop
- [ ] Implement support for editable control flows
    * [x] Blocks with triggers, conditions and actions
    * [ ] Flows Page with list and details view
    * [ ] Implement notifications support (with triggers)
- [ ] Implement display of indoor temperature per room with graphs
- [ ] Implement support for geocoder for address and reverse lookup
- [ ] Move identity, account, dashboard and home from feature to core
- [ ] Implement support for virtual devices (as composition of tokens)
- [ ] Making a button that turns on/off "the whole cabin" (at home / away from home) 
- [ ] Move state and integrations to backend

## Supported features
- [x] Sikom thermostats
- [x] Sikom power controller
- [x] Sikom buttons (and astro switch)
- [x] Webcam for easy viewing in one place
- [x] Read and save historical data from rtl_433 devices
 
## Experiments and ideas to explore

- Refactor refresh of camera information and snapshot using timing service and streams
- Use package [image_compare](https://pub.dev/packages/image_compare) to detect movement locally by inspection of snapshot streams
- Use package [zwave](https://pub.dev/packages/zwave) on rpi4 to read from [z-wave 3-phase power meter](https://www.eldirekte.no/aeotec-strom-maler-3fas-60a-z-wave/cat-p/c/p10637336)


# Developing

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