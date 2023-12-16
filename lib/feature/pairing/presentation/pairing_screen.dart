import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_dash/feature/pairing/presentation/pairing_screen_controller.dart';
import 'package:smart_dash/feature/pairing/presentation/paring_routes.dart';
import 'package:smart_dash/feature/device/domain/driver_definition.dart';
import 'package:smart_dash/widget/list/route_selector.dart';
import 'package:smart_dash/widget/load/async_load_screen.dart';

class PairingScreen extends ConsumerWidget {
  const PairingScreen({
    super.key,
    required this.location,
  });

  final String location;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AsyncLoadScreen<PairingQuery, DriverDefinitionMap>(
      title: 'Pairing services',
      onClose: () => context.go(location),
      query: PairingQuery(),
      provider: pairingScreenControllerProvider,
      builder: (context, ref, services, child) {
        return Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text('Choose a service to pair with. SmartDash '
                    'will ask for your service login information '
                    'the first time you connect to it, or if your current '
                    'login information has expired.'),
              ),
            ),
            const Divider(),
            Expanded(
              flex: 1,
              child: RouteSelectorList<DriverDefinition>(
                iconBuilder: (_, service, __) => Image.asset(
                  'assets/images/${service.image}',
                  fit: BoxFit.cover,
                  width: 40,
                ),
                titleBuilder: (_, service, __) => Text(service.name),
                entries: services.isPresent ? services.value.values : [],
                pathBuilder: (data) => PairingScreens.toListDeviceTypesPath(
                  data,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
