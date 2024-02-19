import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_dash/core/presentation/widget/smart_dash_error_widget.dart';
import 'package:smart_dash/core/presentation/widget/smart_dash_progress_indicator.dart';
import 'package:smart_dash/feature/home/application/home_service.dart';
import 'package:smart_dash/feature/home/domain/home.dart';

class HomeSelector extends ConsumerWidget {
  const HomeSelector({
    super.key,
    this.onChanged,
  });

  final ValueChanged<Home>? onChanged;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(getHomesProvider()).when(
          data: (homes) {
            if (homes.isEmpty) {
              return Tooltip(
                message: 'You need to create a new home',
                child: DropdownButton(
                  hint: const Text('No Homes'),
                  items: const [],
                  onChanged: null,
                ),
              );
            }
            if (homes.length == 1) {
              return Tooltip(
                message: 'Only one home available',
                child: DropdownButton(
                  hint: Text(homes.first.name),
                  items: const [],
                  onChanged: null,
                ),
              );
            }

            return ref.watch(getCurrentHomeProvider()).when(
                  data: (currentHome) {
                    return DropdownButton<Home>(
                      hint: const Text('Select a Home'),
                      value: currentHome.orElseNull,
                      autofocus: false,
                      items: homes
                          .map((home) => DropdownMenuItem(
                                value: home,
                                child: Text(home.name),
                              ))
                          .toList(),
                      onChanged: (home) {
                        assert(home != null, 'Home can not be unselected');
                        if (onChanged != null) {
                          onChanged!(home!);
                        }
                      },
                    );
                  },
                  error: SmartDashErrorWidget.from,
                  loading: SmartDashProgressIndicator.new,
                );
          },
          error: SmartDashErrorWidget.from,
          loading: SmartDashProgressIndicator.new,
        );
  }
}
