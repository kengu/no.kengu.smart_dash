import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart' hide ProgressIndicator;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:optional/optional.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:smart_dash_account/smart_dash_account_app.dart';
import 'package:smart_dash_app/core/presentation/dialog.dart';
import 'package:smart_dash_app/core/presentation/screens.dart';
import 'package:smart_dash_app/core/presentation/theme/smart_dash_theme_data.dart';
import 'package:smart_dash_app/core/presentation/widget.dart';
import 'package:smart_dash_app/core/presentation/widget/form/async_form_screen.dart';
import 'package:smart_dash_app/core/presentation/widget/form/field/smart_dash_expansion_group_field.dart';
import 'package:smart_dash_app/core/presentation/widget/form/field/smart_dash_text_field.dart';
import 'package:smart_dash_app/core/presentation/widget/list/expansion_list.dart';
import 'package:smart_dash_app/core/presentation/widget/smart_dash_error_widget.dart';
import 'package:smart_dash_app/core/presentation/widget/smart_dash_progress_indicator.dart';
import 'package:smart_dash_app/core/presentation/widget/snackbar/snackbar_controller.dart';
import 'package:smart_dash_app/feature/presence/domain/presence.dart';
import 'package:smart_dash_app/feature/system/application/network_info_service.dart';
import 'package:smart_dash_app/integration/application/integration_manager.dart';
import 'package:smart_dash_common/smart_dash_common.dart';

import 'account_form_screen_controller.dart';

class AccountFormScreen extends ConsumerWidget {
  const AccountFormScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userRepositoryProvider).currentUser;
    final manager = ref.watch(integrationManagerProvider).requireValue;
    final integrations = manager.getAll();

    return ref.watch(getCurrentHomeProvider()).when(
          data: (currentHome) {
            return AsyncFormScreen<AccountQuery, Account,
                AccountFormScreenController>(
              title: 'Edit account',
              scrollable: true,
              query: AccountQuery(
                userId: user.userId,
                serviceKeys: integrations.values
                    .where((e) => !e.system)
                    .map((e) => e.key),
              ),
              provider: accountFormScreenControllerProvider.call,
              onClose: () => context.pop(),
              onSubmitted: (account) => SnackbarController.showSnackBarByRef(
                context,
                ref,
                'Saved account for ${jsonEncode(account.name)}',
              ),
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  children: [
                    SmartDashTextField<String>(
                      labelText: 'First name',
                      formControlName: AccountFields.fname,
                      validationMessages: {
                        ValidationMessage.required: (_) =>
                            'Please enter firstname',
                      },
                    ),
                    const SizedBox(height: 16.0),
                    SmartDashTextField<String>(
                      labelText: 'Last name',
                      formControlName: AccountFields.lname,
                      validationMessages: {
                        ValidationMessage.required: (_) =>
                            'Please enter lastname',
                      },
                    ),
                    _CurrentHomeSetup(
                      currentHome: currentHome,
                      integrations: integrations,
                    ),
                  ],
                ),
              ),
            );
          },
          error: SmartDashErrorWidget.from,
          loading: SmartDashProgressIndicator.new,
        );
  }
}

class _CurrentHomeSetup extends ConsumerWidget {
  const _CurrentHomeSetup({
    required this.currentHome,
    required this.integrations,
  });

  final Optional<Home> currentHome;
  final IntegrationMap integrations;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (!currentHome.isPresent) {
      return const ListTile(
        title: Text('No Home'),
        leading: Icon(Icons.home_work, size: 48),
      );
    }
    ref.read(accountServiceProvider).getAccount();
    return ReactiveFormArray<JsonObject>(
      formArrayName: AccountFields.homes,
      builder: (context, array, child) {
        assert(
          array.isNotNull,
          'An account requires at least one home, found none',
        );
        final homes = array.value!
            .whereNotNull()
            .map(Home.fromJson)
            .map((e) => e.id)
            .toList();
        final current = currentHome.value;
        final index = homes.indexOf(current.id);
        assert(
          index > -1,
          'Current home ${current.id} not found in homes [${homes.join(',')}]',
        );

        final controller = AccountFormScreenController.forCurrentUser(ref);
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _HomeInfoField(
              index: index,
              homes: array,
            ),
            _HomeMembersField(
              controller: controller,
              members: array.control(
                '$index.${HomeFields.members}',
              ) as FormArray<JsonObject>,
            ),
            _HomeServicesField(
              controller: controller,
              integrations: integrations,
              services: array.control(
                '$index.${HomeFields.services}',
              ) as FormArray<JsonObject>,
            )
          ],
        );
      },
    );
  }
}

// Path: homes
class _HomeInfoField extends StatelessWidget {
  const _HomeInfoField({
    required this.index,
    required this.homes,
  });

  final int index;
  final FormArray<JsonObject> homes;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: const Text('Home'),
      subtitle: Text(
        'Manage home information',
        style: getLegendTextStyle(context),
      ),
      shape: const Border(),
      tilePadding: const EdgeInsets.only(top: 16),
      leading: const Icon(Icons.home, size: 48),
      childrenPadding: const EdgeInsets.all(8.0),
      backgroundColor: Theme.of(context).colorScheme.surface.lighten(0.02),
      children: [
        Text(
          'Set a nickname and address for '
          'this home. Add members to this home'
          'to enable presence detection  '
          'automations based on this',
          style: getLegendTextStyle(context),
        ),
        const SizedBox(height: 16.0),
        SmartDashTextField<String>(
          labelText: 'Nickname',
          formControlName: '$index.${HomeFields.name}',
          validationMessages: {
            ValidationMessage.required: (_) => 'Please enter home name',
          },
        ),
        const SizedBox(height: 16.0),
        _LocationField(
          index: index,
          group: homes.controls[index] as FormGroup,
        ),
      ],
    );
  }
}

class _LocationField extends ConsumerWidget {
  const _LocationField({
    required this.index,
    required this.group,
  });

  final int index;
  final FormGroup group;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return _buildGroup(
      context,
      () async {
        final formGroup = (group.control(HomeFields.location) as FormGroup);
        final result = await showSearchDialog<Location>(
          context,
          title: 'Find location',
          query: formGroup.value[LocationField.name] as String,
          search: (query) => ref
              .read(locationManagerProvider)
              .searchByNameAsStream(query: query),
          resultBuilder: (location, selected) => ListTile(
            selected: selected,
            contentPadding: EdgeInsets.zero,
            title: Text(location.address),
            leading: const Icon(Icons.place),
            subtitle: Text('${location.lon}, ${location.lat}'),
          ),
        );
        if (result.isPresent) {
          final location = result.value;
          formGroup.value = {
            LocationField.lon: location.lon,
            LocationField.lat: location.lat,
            LocationField.name: location.address,
          };
        }
      },
      (context, name, control) {
        switch (name) {
          case LocationField.name:
            return SmartDashTextField<String>(
              labelText: 'Place',
              allowEmpty: false,
              formPath: [index, HomeFields.location],
              formControlName: LocationField.name,
              validationMessages: {
                ValidationMessage.required: (_) => 'Please enter place',
              },
            );
          case LocationField.lon:
            return SmartDashTextField<double>(
              labelText: 'Longitude',
              allowEmpty: false,
              formPath: [index, HomeFields.location],
              formControlName: LocationField.lon,
              valueAccessor: DoubleValueAccessor(fractionDigits: 4),
              validationMessages: {
                ValidationMessage.required: (_) => 'Please enter longitude',
                ValidationMessage.pattern: (_) => 'Not decimal degrees',
              },
            );
          case LocationField.lat:
            return SmartDashTextField<double>(
              labelText: 'Latitude',
              allowEmpty: false,
              formPath: [index, HomeFields.location],
              formControlName: LocationField.lat,
              valueAccessor: DoubleValueAccessor(fractionDigits: 4),
              validationMessages: {
                ValidationMessage.required: (_) => 'Please enter latitude',
                ValidationMessage.pattern: (_) => 'Not decimal degrees',
              },
            );
        }
        return Container();
      },
    );
  }

  SmartDashExpansionList<dynamic> _buildGroup(
    BuildContext context,
    VoidCallback onSearch,
    SmartDashExpansionGroupFieldItemBuilder itemBuilder,
  ) {
    int index = 0;
    final formGroup = (group.control(HomeFields.location) as FormGroup);
    final keys = formGroup.controls.keys.toList();
    return SmartDashExpansionList(
      title: const Text('Location'),
      description: Text(
        'Manage home location',
        style: getLegendTextStyle(context),
      ),
      trailing: Icons.search,
      onPressed: onSearch,
      children: formGroup.controls.values
          .map((e) => itemBuilder(
                context,
                keys[index++],
                e as AbstractControl,
              ))
          .toList(),
    );
  }
}

// Path: homes.index.members.index
class _HomeMembersField extends ConsumerWidget {
  const _HomeMembersField({
    required this.members,
    required this.controller,
  });

  final FormArray<Object> members;
  final AccountFormScreenController controller;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final network = ref.read(networkInfoServiceProvider);
    return StreamBuilder<NetworkScanProgress>(
        stream: network.progress,
        initialData: network.getProgress(),
        builder: (context, snapshot) {
          final devices = ref
              .read(networkInfoServiceProvider)
              .devices
              .map(Presence.toHomeMember)
              .toList();
          final missing = _calcMissing(devices);
          return ReactiveFormArray(
              formArray: members,
              builder: (context, _, __) {
                return ExpansionTile(
                  title: const Text('Members'),
                  subtitle: Text(
                    'Let devices track presence',
                    style: getLegendTextStyle(context),
                  ),
                  maintainState: true,
                  shape: const Border(),
                  leading: const Icon(Icons.group, size: 48.0),
                  tilePadding: const EdgeInsets.only(top: 16.0),
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: PopupMenuButton<HomeMember>(
                        enabled: missing.isNotEmpty,
                        position: PopupMenuPosition.over,
                        constraints: const BoxConstraints(
                          minWidth: 400,
                        ),
                        tooltip: devices.isNotEmpty
                            ? 'Add member to home'
                            : 'No more members to add',
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.add),
                            Text('ADD MEMBER TO HOME'),
                          ],
                        ),
                        onSelected: (HomeMember key) {
                          members.add(
                            controller.buildMemberFieldsForm(key),
                            emitEvent: true,
                            updateParent: true,
                          );
                        },
                        itemBuilder: (BuildContext context) {
                          return missing
                              .map((e) => PopupMenuItem<HomeMember>(
                                    value: e,
                                    child: Row(
                                      children: [
                                        const Icon(Icons.device_unknown),
                                        const SizedBox(width: 16),
                                        Text(e.name,
                                            overflow: TextOverflow.ellipsis),
                                      ],
                                    ),
                                  ))
                              .toList();
                        },
                      ),
                    ),
                    ...members.fieldBuilder(
                      (index, value) => _HomeMemberField(
                        index: index,
                        members: members,
                      ),
                    ),
                    if (!network.isEnabled)
                      ListTile(
                        title: const Text(
                          'Presence is disabled',
                        ),
                        contentPadding: EdgeInsets.zero,
                        subtitle: Text(
                          'Goto Settings to enable',
                          style: getLegendTextStyle(context),
                        ),
                        trailing: IconButton(
                          icon: const Icon(Icons.arrow_forward_ios),
                          onPressed: () => context.push(Screens.settings),
                        ),
                      ),
                  ],
                );
              });
        });
  }

  List<HomeMember> _calcMissing(List<HomeMember> all) {
    final uses = (members.value?.whereType<JsonObject>().toSet() ?? {})
        .map(HomeMember.fromJson)
        .map((e) => e.key);
    final missing = all.toList();
    return missing..removeWhere((e) => uses.contains(e.key));
  }
}

// Path: homes.index.services
class _HomeMemberField extends StatefulWidget {
  const _HomeMemberField({
    required this.index,
    required this.members,
  });

  final int index;
  final FormArray<Object> members;

  @override
  State<_HomeMemberField> createState() => _HomeMemberFieldState();
}

class _HomeMemberFieldState extends State<_HomeMemberField> {
  @override
  Widget build(BuildContext context) {
    final member = widget.members.value![widget.index] as JsonObject;
    final name = member[HomeMemberFields.name] as String;
    return ExpansionTile(
      title: Text(name),
      subtitle: Text(
        'Click to manage member',
        style: getLegendTextStyle(context),
      ),
      maintainState: true,
      shape: const Border(),
      collapsedShape: const Border(),
      tilePadding: const EdgeInsets.only(top: 0),
      childrenPadding: const EdgeInsets.all(8.0),
      backgroundColor: Theme.of(context).colorScheme.surface.lighten(0.02),
      leading: const Icon(Icons.device_unknown),
      trailing: IconButton(
        icon: const Icon(Icons.delete),
        onPressed: () async {
          final remove = await showDialog<bool>(
            context: context,
            builder: (BuildContext context) => AlertDialog(
              title: Text('Remove $name'),
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
            widget.members.removeAt(
              widget.index,
              emitEvent: true,
              updateParent: true,
            );
          }
        },
      ),
      children: [
        const SizedBox(height: 16.0),
        SmartDashTextField<String>(
          labelText: 'Name',
          formControlName: '${widget.index}.${HomeMemberFields.name}',
          validationMessages: {
            ValidationMessage.required: (_) => 'Please enter an device name',
          },
        ),
        const SizedBox(height: 8),
        ListTile(
          title: const Text('Key'),
          dense: true,
          contentPadding: EdgeInsets.zero,
          subtitle: Text(member[HomeMemberFields.key] as String),
        )
      ],
    );
  }
}

// Path: homes.index.services
class _HomeServicesField extends StatelessWidget {
  _HomeServicesField({
    required this.services,
    required this.controller,
    required this.integrations,
  }) {
    assert(integrations.isNotEmpty, 'Integrations can not be empty');
  }

  final FormArray<Object> services;
  final IntegrationMap integrations;
  final AccountFormScreenController controller;

  final _popupMenuKey = GlobalKey<PopupMenuButtonState>();

  @override
  Widget build(BuildContext context) {
    return ReactiveFormArray(
      formArray: services,
      builder: (context, _, __) {
        final (instances, missing) = _calcMissing();
        return ExpansionTile(
          title: const Text('Services'),
          subtitle: Text(
            'Configure services for this home',
            style: getLegendTextStyle(context),
          ),
          maintainState: true,
          shape: const Border(),
          collapsedShape: const Border(),
          tilePadding: const EdgeInsets.only(top: 16),
          leading: const Icon(Icons.electrical_services, size: 48),
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: PopupMenuButton<String>(
                key: _popupMenuKey,
                position: PopupMenuPosition.over,
                tooltip: missing.isNotEmpty
                    ? 'Add service to home'
                    : 'No more services to add',
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.add),
                    Text('ADD SERVICE TO HOME'),
                  ],
                ),
                onSelected: (String service) {
                  services.add(
                    controller.buildServiceFieldsForm(
                      ServiceConfig.fromDefinition(integrations[service]!),
                    ),
                    emitEvent: true,
                    updateParent: true,
                  );
                },
                itemBuilder: (BuildContext context) {
                  return missing
                      .map((key) => _buildPopupMenuItem(key, instances))
                      .toList();
                },
              ),
            ),
            ...services.fieldBuilder<JsonObject>(
              (index, value) => _HomeServiceField(
                index: index,
                services: services,
                integrations: integrations,
                serviceKey: value[ServiceConfigFields.key] as String,
              ),
            ),
          ],
        );
      },
    );
  }

  PopupMenuItem<String> _buildPopupMenuItem(
      String key, Map<String, int> instances) {
    return PopupMenuItem<String>(
      value: key,
      child: Row(
        children: [
          Image.asset(
            'assets/images/${integrations[key]!.image}',
            fit: BoxFit.cover,
            cacheWidth: 24,
            cacheHeight: 24,
          ),
          const SizedBox(width: 16),
          Text(
            instances[key]! > 1
                ? '${integrations[key]!.name} (${instances[key]} left)'
                : integrations[key]!.name,
          ),
        ],
      ),
    );
  }

  (Map<String, int>, Set<String>) _calcMissing() {
    final integrated = services.value
            ?.whereType<JsonObject>()
            .map(ServiceConfig.fromJson)
            .toList() ??
        <ServiceConfig>[];
    final uses = integrated.map((e) => e.key).toSet();
    final instances = integrations.map(
      (key, value) => MapEntry(key, value.instances),
    );
    final missing = integrations.keys.toSet()
      ..removeWhere((key) {
        if (uses.contains(key)) {
          if (instances.containsKey(key)) {
            instances[key] =
                instances[key]! - integrated.where((e) => e.key == key).length;
          }
        }
        return instances[key] == 0;
      });
    return (instances, missing);
  }
}

// Path: homes.index.services
class _HomeServiceField extends StatefulWidget {
  const _HomeServiceField({
    required this.index,
    required this.services,
    required this.serviceKey,
    required this.integrations,
  });

  final int index;
  final String serviceKey;
  final FormArray<Object> services;
  final IntegrationMap integrations;

  @override
  State<_HomeServiceField> createState() => _HomeServiceFieldState();
}

class _HomeServiceFieldState extends State<_HomeServiceField> {
  bool _passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    final service = widget.integrations[widget.serviceKey]!;
    if (service.fields.isEmpty) {
      return Padding(
        padding: const EdgeInsets.only(top: 16.0),
        child: ListTile(
          title: Text(service.name),
          subtitle: _buildTitle(service, context),
          shape: const Border(),
          leading: _buildTileIcon(service),
          contentPadding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
          trailing: _buildDeleteButton(context, service),
        ),
      );
    }
    return ExpansionTile(
      title: Text(service.name),
      subtitle: _buildTitle(service, context),
      maintainState: true,
      shape: const Border(),
      collapsedShape: const Border(),
      tilePadding: const EdgeInsets.only(top: 16),
      childrenPadding: const EdgeInsets.all(8.0),
      backgroundColor: Theme.of(context).colorScheme.surface.lighten(0.02),
      leading: _buildTileIcon(service),
      trailing: _buildDeleteButton(context, service),
      children: [
        if (service.fields.isEmpty) Text('No parameters'),
        if (service.fields.contains(IntegrationField.id)) ...[
          const SizedBox(height: 16.0),
          SmartDashTextField<String>(
            labelText: switch (service.type) {
              IntegrationType.device => 'Device',
              IntegrationType.camera => 'Camera',
              IntegrationType.location => 'Location',
              _ => 'Name',
            },
            formControlName:
                '${widget.index}.data.${ServiceConfigDataFields.id}',
            validationMessages: {
              ValidationMessage.required: (_) => 'Please enter an device name',
            },
          ),
        ],
        if (service.fields.contains(IntegrationField.host)) ...[
          const SizedBox(height: 16.0),
          SmartDashTextField<String>(
            labelText: 'Host',
            formControlName:
                '${widget.index}.data.${ServiceConfigDataFields.host}',
            validationMessages: {
              ValidationMessage.required: (_) =>
                  'Please enter an ip address or host name',
              ValidationMessage.pattern: (_) =>
                  'Please enter an ip address or host name',
            },
          ),
        ],
        if (service.fields.contains(IntegrationField.port)) ...[
          const SizedBox(height: 16.0),
          SmartDashTextField<String>(
            labelText: 'Port',
            formControlName:
                '${widget.index}.data.${ServiceConfigDataFields.port}',
            validationMessages: {
              ValidationMessage.required: (_) => 'Please enter a host port',
              ValidationMessage.pattern: (_) => 'Please enter a host port',
            },
          ),
        ],
        if (service.fields.contains(IntegrationField.username)) ...[
          const SizedBox(height: 16.0),
          SmartDashTextField<String>(
            labelText: 'Username',
            formControlName:
                '${widget.index}.data.${ServiceConfigDataFields.username}',
            validationMessages: {
              ValidationMessage.required: (_) => 'Please enter an username',
            },
          ),
        ],
        if (service.fields.contains(IntegrationField.password)) ...[
          const SizedBox(height: 16.0),
          SmartDashTextField<String>(
            labelText: 'Password',
            formControlName:
                '${widget.index}.data.${ServiceConfigDataFields.password}',
            obscureText: !_passwordVisible,
            validationMessages: {
              ValidationMessage.required: (_) => 'Please enter an password',
            },
            suffixIcon: _buildVisibility(),
            textInputAction: TextInputAction.send,
          ),
        ],
        if (service.fields.contains(IntegrationField.topics)) ...[
          const SizedBox(height: 16.0),
          SmartDashTextField<String>(
            labelText: 'Topics (comma separated)',
            minLines: 1,
            maxLines: 3,
            formControlName:
                '${widget.index}.data.${ServiceConfigDataFields.topics}',
            validationMessages: {
              ValidationMessage.required: (_) =>
                  'Please enter at least one topic',
            },
            suffixIcon: _buildVisibility(),
            textInputAction: TextInputAction.send,
          ),
        ],
      ],
    );
  }

  Text _buildTitle(Integration service, BuildContext context) {
    return Text(
      service.description,
      style: getLegendTextStyle(context),
    );
  }

  Image _buildTileIcon(Integration service) {
    return Image.asset(
      'assets/images/${service.image}',
      fit: BoxFit.cover,
      cacheHeight: 32,
      cacheWidth: 32,
    );
  }

  IconButton _buildDeleteButton(BuildContext context, Integration service) {
    return IconButton(
      icon: const Icon(Icons.delete),
      onPressed: () async {
        final remove = await showDialog<bool>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: Text('Remove ${service.name}'),
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
          widget.services.removeAt(
            widget.index,
            emitEvent: true,
            updateParent: true,
          );
        }
      },
    );
  }

  Widget? _buildVisibility() {
    return IconButton(
      icon: Icon(
        _passwordVisible
            ? Icons.visibility_outlined
            : Icons.visibility_off_outlined,
        color: Colors.grey[700],
      ),
      onPressed: () => setState(
        () => _passwordVisible = !_passwordVisible,
      ),
    );
  }
}
