import 'package:smart_dash_app/feature/device/presentation/device_routes.dart';
import 'package:smart_dash_app/feature/flow/presentation/flow_routes.dart';
import 'package:smart_dash_app/feature/notification/presentation/notification_routes.dart';
import 'package:smart_dash_app/feature/pairing/presentation/paring_routes.dart';
import 'package:smart_dash_app/feature/system/presentation/system_routes.dart';

class Screens {
  static const account = '/account';
  static const settings = '/settings';
  static const devices = DeviceScreens.home;
  static const deviceDetails = DeviceScreens.details;
  static const pairing = PairingScreens.home;
  static const pairingListNewDevices = PairingScreens.listNewDevices;
  static const pairingListDeviceTypes = PairingScreens.listDeviceTypes;
  static const camera = '/camera';
  static const flowCopy = FlowRoutes.copy;
  static const flowSelect = FlowRoutes.select;
  static const flowCreate = FlowRoutes.create;
  static const flowDetails = FlowRoutes.details;
  static const notifications = NotificationScreens.home;
  static const system = SystemScreens.home;
  static const systemHealth = SystemScreens.health;

  // TODO: Make list this dynamic, easy to forget to update this list
  static const List<String> locations = [
    Screens.account,
    Screens.settings,
    Screens.devices,
    Screens.deviceDetails,
    Screens.pairing,
    Screens.pairingListDeviceTypes,
    Screens.pairingListNewDevices,
    Screens.camera,
    Screens.flowCopy,
    Screens.flowSelect,
    Screens.flowCreate,
    Screens.flowDetails,
    Screens.notifications,
    Screens.system,
    Screens.systemHealth,
  ];

  static String toPath(List<String> segments) => segments.join('/');

  static int indexOf(String location) =>
      locations.indexOf(location.split('?')[0]);

  static bool contains(String location) =>
      locations.contains(location.split('?')[0]);
}
