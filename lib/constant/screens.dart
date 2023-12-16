import 'package:smart_dash/feature/device/presentation/device_routes.dart';
import 'package:smart_dash/feature/pairing/presentation/paring_routes.dart';

class Screens {
  static const account = '/account';
  static const settings = '/settings';
  static const device = DeviceScreens.home;
  static const pairing = PairingScreens.home;

  static const deviceListPaired = '$device/${DeviceScreens.listPaired}';
  static const deviceDetails = '$device/${DeviceScreens.details}';

  static const pairingListDeviceTypes =
      '$pairing/${PairingScreens.listDeviceTypes}';

  static const pairingListNewDevices =
      '$pairing/${PairingScreens.listNewDevices}';

  // TODO: Make list this dynamic, easy to forget to update this list
  static const List<String> locations = [
    Screens.account,
    Screens.settings,
    Screens.device,
    Screens.deviceListPaired,
    Screens.deviceDetails,
    Screens.pairing,
    Screens.pairingListDeviceTypes,
    Screens.pairingListNewDevices,
  ];

  static String toPath(List<String> segments) => segments.join('/');

  static int indexOf(String location) => locations.indexOf(location);
}
