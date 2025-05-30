import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_dash_account/smart_dash_account.dart';
import 'package:smart_dash_app/core/presentation/widget/list/route_selector.dart';
import 'package:smart_dash_app/core/presentation/widget/state/smart_dash_state.dart';
import 'package:smart_dash_app/feature/pairing/presentation/pairing_screen_controller.dart';
import 'package:smart_dash_app/feature/pairing/presentation/paring_routes.dart';

class PairingScreen extends ConsumerWidget {
  const PairingScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AsyncViewModelScreen<PairingQuery, IntegrationMap,
        PairingScreenController>(
      title: 'Pair home with device',
      onClose: () => context.pop(),
      query: PairingQuery(),
      provider: pairingScreenControllerProvider.call,
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
              child: RouteSelectorList<Integration>(
                iconBuilder: (_, service, __) => Image.asset(
                  'assets/images/${service.image}',
                  fit: BoxFit.cover,
                  width: 40,
                ),
                pathBuilder: PairingScreens.toListDeviceTypesPath,
                entries: services.isPresent ? services.value.values : [],
                titleBuilder: (_, service, __) => Text(service.name),
              ),
            ),
          ],
        );
      },
    );
  }
}
