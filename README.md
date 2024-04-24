# Smart Dash Project

A Smart Dashboard project for my personal use.

# Developing

This project is organized as a mono-repo using [Melos](https://pub.dev/packages/melos). 

Bootstrap monorepo management tool (only needed once)
```bash
dart pub global activate melos
```

Prepare development environment (macOS only for now)
```bash
melos run prepare
```

Upgrade all dependencies at once
```bash
melos run upgrade
```

# Modules
Following modules (app or package) have additional development scripts

* [SmartDash App (app)](apps/smart_dash/README.md)

