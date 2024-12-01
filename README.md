# Smart Dash Project 

[![Publish](https://github.com/kengu/no.kengu.smart_dash/actions/workflows/publish.yml/badge.svg)](https://github.com/kengu/no.kengu.smart_dash/actions/workflows/publish.yml)

_A Smart Dashboard project for my personal use._

This document provides a summary of the architecture to help developers 
quickly understand how the various modules are structured and interact. 
The project is organized as a monorepo and it follows a modular architecture 
to ensure scalability and maintainability.

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

Run each time you add or remove a feature or package
```bash
melos bootstrap
```

Upgrade all dependencies at once
```bash
melos run upgrade
```

# Modules
The project is divided into four type of modules, 
where each module type serves a specific purpose:

* [Apps](#apps): Top-level frontend modules that build user interfaces by utilizing lower-level modules.
* [Backends](#backends): Provides APIs that top-level modules use to implement business logic and data persistence.
* [Features](#features): Implements vertical slices of business logic for both apps and backends. Integrations with third-party services are typically done in the backend, following [BFF](https://bff-patterns.com/) pattern.
* [Packages](#packages): Low-level modules that provide reusable functionality to higher-level modules.

## Apps
* [SmartDash App](apps/smart_dash_app/README.md): Primary frontend focusing on user homes, devices, and automation.

## Backends
* [SmartDash Cloud](backends/smart_dash_cloud/README.md): Manages accounts, configurations and monitoring.
* [SmartDash Daemon](backends/smart_dash_daemon/README.md): Runs local smart device and third party service integrations.
* [SmartDash Gateway](backends/smart_dash_gateway/README.md): Acts as the reverse proxy for accessing daemons, especially when they are behind NAT or dynamic IP addresses.

## Features
* [SmartDash Account](features/smart_dash_account/README.md): Manages user accounts, authentication, and authorization.
* [SmartDash Geocoder](features/smart_dash_geocoder/README.md): Provides geolocation services and address resolution.
* [SmartDash Analytics](features/smart_dash_analytics/README.md): Handles metrics and analysis of home and device data.
* [SmartDash Flow](features/smart_dash_flow/README.md): Implements workflows and automations for smart homes.
* [SmartDash MQTT](features/smart_dash_mqtt/README.md): MQTT-based services for real-time device communication.
* [SmartDash Snow](features/smart_dash_snow/README.md): Provides snow depth and snow conditions integrations.
* [SmartDash Energy](features/smart_dash_energy/README.md): Monitors and manages energy usage and related analytics.
* [SmartDash Device](features/smart_dash_device/README.md): Manages device-level interactions and control.
* [SmartDash Camera](features/smart_dash_camera/README.md): Handles camera devices and related media streams.
* [SmartDash Weather](features/smart_dash_weather/README.md): Integrates weather information services.
* [SmartDash Presence)](features/smart_dash_presence/README.md): Manages presence detection and occupancy monitoring.
* [SmartDash Notification](features/smart_dash_notification/README.md): Sends notifications to users based on system events or alerts.

## Packages
* [SmartDash Common](packages/smart_dash_common/README.md): Shared utilities and functionality.
* [SmartDash Datasource](packages/smart_dash_datasource/README.md): Data access and persistence-related utilities.
* [SmartDash Integration](packages/smart_dash_integration/README.md): Common logic for integrating with third-party services.
* [Restoration Web Plugin](packages/restoration_web_plugin/README.md): Flutter plugin for the web to manage browser-related data persistence.


## Architectural Approach
The architecture adheres to the following principles.

### Local-First with Cloud Fallback
The Smart Dash app follows a **local-first approach**. It attempts to connect directly to a local daemon using mDNS or UPnP to provide the lowest latency and best user experience. If no local daemon is found or accessible, the app will fall back to connect via the **SmartDash Gateway** in the cloud.

- **Daemon Discovery**: Each time the network state changes, the app checks for local daemons. If it detects a new daemon that hasn't been onboarded, the app will initiate an onboarding process (requiring user authentication and authorization).
- **REST and WebSocket Support**: Daemons expose both **REST** (for lookups and commands) and **WebSocket** (for listening to real-time updates) APIs, ensuring flexible communication methods for different types of interactions.

### Backend-For-Frontend (BFF) Pattern
The **BFF pattern** is used for integrating third-party services, especially in backends like **SmartDash Daemon** and **SmartDash Cloud**. Each integration is tailored for the needs of specific apps or user contexts, ensuring efficient and secure data handling.

### Persistent WebSocket for Monitoring and Control
The **SmartDash Daemon** maintains a **persistent WebSocket connection** to the cloud for monitoring and control purposes. This WebSocket is used only for administrative tasks and diagnostics, not for acting as a reverse proxy or for general command execution from the app to the daemon.

## Development Guidelines
- **Separation of Concerns**: Features encapsulate distinct aspects of business logic, making it easy to maintain and extend functionality as the project evolves.
- **Local-First Priority**: Always prioritize local connections for daemons when building or modifying features. The fallback to the cloud should be seamless for users.
- **Vertical Slice Implementation**: When adding new features, implement them as vertical slices that can be utilized by both apps and backends without duplicating logic.

This modular approach ensures the codebase remains scalable and maintainable while supporting the complexities of managing smart home environments across multiple user contexts and device types.

