import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/material.dart' hide ProgressIndicator;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:smart_dash/core/presentation/widget/form/field/smart_dash_dropdown_field.dart';
import 'package:smart_dash/feature/account/domain/account.dart';
import 'package:smart_dash/feature/account/domain/service_config.dart';
import 'package:smart_dash/feature/identity/data/user_repository.dart';
import 'package:smart_dash/feature/system/application/network_info_service.dart';
import 'package:smart_dash/integration/data/integration_repository.dart';
import 'package:smart_dash/integration/domain/integration.dart';
import 'package:smart_dash/core/presentation/widget/form/field/smart_dash_text_field.dart';
import 'package:smart_dash/core/presentation/widget/form/async_form_screen.dart';
import 'package:smart_dash/core/presentation/widget/notice/notice_controller.dart';
import 'package:smart_dash/core/presentation/widget/smart_dash_error_widget.dart';
import 'package:smart_dash/core/presentation/widget/smart_dash_progress_indicator.dart';

import 'account_form_screen_controller.dart';
import 'field/service_field_group.dart';

class AccountFormScreen extends ConsumerWidget {
  const AccountFormScreen({
    super.key,
    required this.location,
  });

  final String location;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.read(userRepositoryProvider).currentUser;
    return ref.watch(integrationRepositoryProvider).when(
          data: (services) {
            return AsyncFormScreen<AccountQuery, Account>(
              title: 'Edit account',
              scrollable: true,
              query: AccountQuery(
                userId: user.userId,
                services: services.keys,
              ),
              provider: accountFormScreenControllerProvider,
              onClose: () => context.go(location),
              onSubmitted: (account) => NoticeController.showSnackBarByRef(
                context,
                ref,
                'Saved account for ${jsonEncode(account.fullName)}',
                location: location,
              ),
              child: _AccountFieldsWidget(
                services: services,
              ),
            );
          },
          error: SmartDashErrorWidget.from,
          loading: () => const SmartDashProgressIndicator(
            message: 'Preparing data',
          ),
        );
  }
}

class _AccountFieldsWidget extends StatelessWidget {
  const _AccountFieldsWidget({
    required this.services,
  });

  final IntegrationMap services;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        children: [
          SmartDashTextField<String>(
            formControlName: AccountFields.fname,
            labelText: 'First name',
            validationMessages: {
              ValidationMessage.required: (_) => 'Please enter firstname',
            },
          ),
          const SizedBox(height: 16.0),
          SmartDashTextField<String>(
            formControlName: AccountFields.lname,
            labelText: 'Last name',
            validationMessages: {
              ValidationMessage.required: (_) => 'Please enter lastname',
            },
          ),
          const _AccountPresenceField(),
          ReactiveFormArray<Object>(
            formArrayName: AccountFields.services,
            builder: (context, formArray, child) {
              return Column(
                children: AccountFormScreenController.from(formArray)
                    .map((e) => ServiceFieldGroup(
                        service: e.key,
                        formArray: formArray,
                        definitions: services,
                        index: AccountFormScreenController.indexWhere(
                          formArray,
                          e,
                        )))
                    .toList(),
              );
            },
          ),
          const SizedBox(height: 56.0),
          _AddServiceMenuButton(
            services: services,
          ),
        ],
      ),
    );
  }
}

class _AccountPresenceField extends ConsumerWidget {
  const _AccountPresenceField();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ExpansionTile(
      title: const Text('Presence Registration'),
      subtitle: const Text('Pick a device on local network'),
      tilePadding: const EdgeInsets.only(top: 16),
      leading: const Icon(Icons.home_work, size: 48),
      trailing: IconButton(
        icon: const Icon(Icons.delete),
        onPressed: () async {
          final remove = await showDialog<bool>(
            context: context,
            builder: (BuildContext context) => AlertDialog(
              title: const Text('Remove presence registration'),
              content: const Text(
                'This will remove all use and pairing.\n'
                'Do you want to proceed?',
              ),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.pop(context, false),
                  child: const Text('NO'),
                ),
                TextButton(
                  onPressed: () => Navigator.pop(context, true),
                  child: const Text('YES'),
                ),
              ],
            ),
          );
          if (remove == true) {
            throw UnimplementedError(
              'TODO: Remove of presence registration',
            );
          }
        },
      ),
      children: [
        const SizedBox(height: 16.0),
        SmartDashDropdownField<String>(
          formControlName: AccountFields.presence,
          labelText: 'Device',
          items: ref
              .read(networkInfoServiceProvider)
              .devicesCached
              .map((e) => DropdownMenuItem<String>(
                    value: jsonEncode(
                      Presence.fromJson(e.toJson()).toJson(),
                    ),
                    child: Tooltip(
                      message: '${e.ipAddress} (Host ${e.macAddress})',
                      preferBelow: true,
                      child: Text(
                        e.readableName,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ))
              .toList(),
          validationMessages: {
            ValidationMessage.required: (_) => 'Please select an device',
          },
        ),
      ],
    );
  }
}

class _AddServiceMenuButton extends StatelessWidget {
  _AddServiceMenuButton({
    required this.services,
  });

  final IntegrationMap services;

  final _popupMenuKey = GlobalKey<PopupMenuButtonState>();

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        return ReactiveFormConsumer(
          builder: (context, form, child) {
            final controller = ref.read(
              accountFormScreenControllerProvider.notifier,
            );
            final formArray = form.control(
              AccountFields.services,
            ) as FormArray;
            final uses = AccountFormScreenController.from(formArray).map(
              (e) => e.key,
            );
            final instances = services.map(
              (key, value) => MapEntry(key, value.instances),
            );
            final missing = services.keys.toSet()
              ..removeWhere((key) {
                if (uses.contains(key)) {
                  if (instances.containsKey(key)) {
                    instances[key] = instances[key]! - 1;
                  }
                }
                return instances[key] == 0;
              });

            return PopupMenuButton<String>(
              key: _popupMenuKey,
              position: PopupMenuPosition.over,
              tooltip: missing.isNotEmpty
                  ? 'Add service to account'
                  : 'No more services to add',
              child: ElevatedButton(
                onPressed: missing.isNotEmpty
                    ? () => _popupMenuKey.currentState?.showButtonMenu()
                    : null,
                child: const Text('ADD SERVICE'),
              ),
              onSelected: (String service) {
                formArray.add(controller.buildServiceFieldsForm(
                  ServiceConfig.fromDriver(
                    services[service]!,
                  ),
                ));
              },
              itemBuilder: (BuildContext context) {
                return missing
                    .map((key) => PopupMenuItem<String>(
                          value: key,
                          child: Row(
                            children: [
                              Image.asset(
                                'assets/images/${services[key]!.image}',
                                fit: BoxFit.cover,
                                cacheWidth: 24,
                                cacheHeight: 24,
                              ),
                              const SizedBox(width: 16),
                              Text(
                                "${services[key]!.name}${instances[key]! > 1 ? ' (${instances[key]} left)' : ''}",
                              ),
                            ],
                          ),
                        ))
                    .toList();
              },
            );
          },
        );
      },
    );
  }
}
