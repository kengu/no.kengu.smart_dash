import 'package:smart_dash/feature/device/presentation/device_routes.dart';
import 'package:smart_dash/feature/flow/presentation/flow_routes.dart';
import 'package:smart_dash/feature/notification/presentation/notification_routes.dart';
import 'package:smart_dash/feature/pairing/presentation/paring_routes.dart';

class Screens {
  static const account = '/account';

  static const settings = '/settings';

  static const devices = DeviceScreens.home;
  static const deviceDetails = DeviceScreens.details;

  static const pairing = PairingScreens.home;
  static const pairingListNewDevices = PairingScreens.listNewDevices;
  static const pairingListDeviceTypes = PairingScreens.listDeviceTypes;

  static const camera = '/camera';

  static const flowSelect = FlowRoutes.select;
  static const flowDetails = FlowRoutes.details;

  static const notifications = NotificationScreens.home;

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
    Screens.flowSelect,
    Screens.flowDetails,
    Screens.notifications,
  ];

  static String toPath(List<String> segments) => segments.join('/');

  static int indexOf(String location) =>
      locations.indexOf(location.split('?')[0]);

  static bool contains(String location) =>
      locations.contains(location.split('?')[0]);
}
