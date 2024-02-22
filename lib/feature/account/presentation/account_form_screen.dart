import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart' hide ProgressIndicator;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:optional/optional.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:smart_dash/core/presentation/screens.dart';
import 'package:smart_dash/core/presentation/widget/form/async_form_screen.dart';
import 'package:smart_dash/core/presentation/widget/form/field/smart_dash_text_field.dart';
import 'package:smart_dash/core/presentation/widget/notice/notice_controller.dart';
import 'package:smart_dash/core/presentation/widget/smart_dash_error_widget.dart';
import 'package:smart_dash/core/presentation/widget/smart_dash_progress_indicator.dart';
import 'package:smart_dash/feature/account/domain/account.dart';
import 'package:smart_dash/feature/account/domain/service_config.dart';
import 'package:smart_dash/feature/home/application/home_service.dart';
import 'package:smart_dash/feature/home/domain/home.dart';
import 'package:smart_dash/feature/identity/data/user_repository.dart';
import 'package:smart_dash/feature/system/application/network_info_service.dart';
import 'package:smart_dash/integration/data/integration_repository.dart';
import 'package:smart_dash/integration/domain/integration.dart';
import 'package:smart_dash/util/data/json.dart';
import 'package:smart_dash/util/widget.dart';

import 'account_form_screen_controller.dart';

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
          data: (integrations) {
            return ref.watch(getCurrentHomeProvider()).when(
                  data: (currentHome) {
                    return AsyncFormScreen<AccountQuery, Account>(
                      title: 'Edit account',
                      scrollable: true,
                      query: AccountQuery(
                        userId: user.userId,
                        serviceKeys: integrations.keys,
                      ),
                      provider: accountFormScreenControllerProvider,
                      onClose: () => context.go(location),
                      onSubmitted: (account) =>
                          NoticeController.showSnackBarByRef(
                        context,
                        ref,
                        'Saved account for ${jsonEncode(account.name)}',
                        location: location,
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
            .map((e) => e.name)
            .toList();
        final current = currentHome.value;
        final index = homes.indexOf(current.name);
        assert(
          index > -1,
          'Current home ${current.name} not found in homes [${homes.join(',')}]',
        );
        final controller = ref.read(
          accountFormScreenControllerProvider.notifier,
        );
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _HomeInfoField(
              index: index,
              homes: array,
              controller: controller,
              integrations: integrations,
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
    required this.controller,
    required this.integrations,
  });

  final int index;
  final FormArray<JsonObject> homes;
  final IntegrationMap integrations;
  final AccountFormScreenController controller;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: const Text('Information'),
      subtitle: Text(
        'Manage home information',
        style: getLegendTextStyle(context),
      ),
      leading: const Icon(Icons.home, size: 48),
      tilePadding: const EdgeInsets.only(top: 16),
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
        SmartDashTextField<String>(
          labelText: 'Address',
          formControlName: '$index.${HomeFields.address}',
        ),
      ],
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
              .devicesCached
              .map(HomeMember.fromDevice)
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
                          onPressed: () => context.push(
                            Screens.settings,
                            extra: Screens.account,
                          ),
                          icon: const Icon(Icons.arrow_forward_ios),
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
      childrenPadding: EdgeInsets.zero,
      tilePadding: const EdgeInsets.only(top: 0),
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
                      ServiceConfig.fromDriver(integrations[service]!),
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
    return ExpansionTile(
      title: Text(service.name),
      subtitle: Text(
        service.description,
        style: getLegendTextStyle(context),
      ),
      maintainState: true,
      shape: const Border(),
      collapsedShape: const Border(),
      childrenPadding: EdgeInsets.zero,
      tilePadding: const EdgeInsets.only(top: 16),
      leading: Image.asset(
        'assets/images/${service.image}',
        fit: BoxFit.cover,
        cacheHeight: 32,
        cacheWidth: 32,
      ),
      trailing: IconButton(
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
      ),
      children: [
        if (service.fields.contains(ServiceField.device)) ...[
          const SizedBox(height: 16.0),
          SmartDashTextField<String>(
            labelText: 'Device',
            formControlName: '${widget.index}.${ServiceConfigFields.device}',
            validationMessages: {
              ValidationMessage.required: (_) => 'Please enter an device name',
            },
          ),
        ],
        if (service.fields.contains(ServiceField.host)) ...[
          const SizedBox(height: 16.0),
          SmartDashTextField<String>(
            labelText: 'Host',
            formControlName: '${widget.index}.${ServiceConfigFields.host}',
            validationMessages: {
              ValidationMessage.required: (_) =>
                  'Please enter an ip address or host name',
              ValidationMessage.pattern: (_) =>
                  'Please enter an ip address or host name',
            },
          ),
        ],
        if (service.fields.contains(ServiceField.port)) ...[
          const SizedBox(height: 16.0),
          SmartDashTextField<int>(
            labelText: 'Port',
            formControlName: '${widget.index}.${ServiceConfigFields.port}',
            validationMessages: {
              ValidationMessage.required: (_) => 'Please enter a host port',
              ValidationMessage.pattern: (_) => 'Please enter a host port',
            },
          ),
        ],
        if (service.fields.contains(ServiceField.username)) ...[
          const SizedBox(height: 16.0),
          SmartDashTextField<String>(
            labelText: 'Username',
            formControlName: '${widget.index}.${ServiceConfigFields.username}',
            validationMessages: {
              ValidationMessage.required: (_) => 'Please enter an username',
            },
          ),
        ],
        if (service.fields.contains(ServiceField.password)) ...[
          const SizedBox(height: 16.0),
          SmartDashTextField<String>(
            labelText: 'Password',
            formControlName: '${widget.index}.${ServiceConfigFields.password}',
            obscureText: !_passwordVisible,
            validationMessages: {
              ValidationMessage.required: (_) => 'Please enter an password',
            },
            suffixIcon: _buildVisibility(),
            textInputAction: TextInputAction.send,
          ),
        ],
      ],
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
