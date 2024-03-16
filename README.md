# Smart Dash

A Smart Dashboard App for my personal use.

## Roadmap

- [ ] Implement pane-based settings screen on desktop
- [ ] Implement support for editable control flows
    * [x] Blocks with triggers, conditions and actions
    * [ ] Screen for creating new flows
    * [ ] Flows Page with list and details view
    * [ ] Add flow notification action
- [ ] Implement support for geocoder for address and reverse lookup
- [ ] Making a button that turns on/off "the whole cabin" (at home / away from home) 
- [ ] Move state and integrations to backend

## Supported features
- [x] Sikom thermostats
- [x] Sikom power controller
- [x] Sikom buttons (and astro switch)
- [x] Webcam for easy viewing in one place
- [x] Read and save historical data from rtl_433 devices
 
## Experiments and ideas to explore

- Display of indoor temperature per room with graphs
- Support for virtual devices (as composition of any tokens)
- Move identity, account, dashboard and home from feature to core
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

## Custom Icons
Use [FlutterIcon](https://www.fluttericon.com/) to generate custom icons package. For details, see
[How to Generate Custom Icons in Flutter](https://www.freecodecamp.org/news/how-to-add-custom-icons-to-your-flutter-application/).

Custom material design icons in svg format can be found at [pictogrammers.com](https://pictogrammers.com/library/mdi/).

### How to modify icons 

1. Open https://www.fluttericon.com
2. Import `asserts/icons/config.json` (click on wrench-icon)
3. Modify existing icons (delete, replace) og add new ones 
   * Make your own or download svg from [pictogrammers.com](https://pictogrammers.com/library/mdi/)
   * Remember to store svg in `asserts/icons`
4. Download updated set of icons from https://www.fluttericon.com
5. Extract files in archive downloaded from https://www.fluttericon.com
6. Copy `fonts/SmartDashIcons.ttf` in archive to `fonts/`
7. Copy `config.json` in archive `asserts/icons/config.json`
8. Copy `smart_dash_icons_icons.dart` in archive to `lib/core/presentation/smart_dash_icons_icons.dart`

