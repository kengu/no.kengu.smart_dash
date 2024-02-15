import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/material.dart' hide ProgressIndicator;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:reactive_forms/reactive_forms.dart';
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
        error: SmartDashErrorWidget.from,
        loading: SmartDashProgressIndicator.new,
        data: (integrations) {
          return AsyncFormScreen<AccountQuery, Account>(
            title: 'Edit account',
            scrollable: true,
            query: AccountQuery(
              userId: user.userId,
              serviceKeys: integrations.keys,
            ),
            provider: accountFormScreenControllerProvider,
            onClose: () => context.go(location),
            onSubmitted: (account) => NoticeController.showSnackBarByRef(
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
                  ReactiveFormArray<JsonObject>(
                    formArrayName: AccountFields.homes,
                    builder: (context, homes, child) {
                      return _AccountHomesField(
                        ref: ref,
                        homes: homes,
                        integrations: integrations,
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }
}

// Path: homes
class _AccountHomesField extends StatelessWidget {
  const _AccountHomesField({
    required this.ref,
    required this.homes,
    required this.integrations,
  });

  final WidgetRef ref;
  final FormArray<JsonObject> homes;
  final IntegrationMap integrations;

  @override
  Widget build(BuildContext context) {
    final controller = ref.read(
      accountFormScreenControllerProvider.notifier,
    );

    return ExpansionTile(
      title: const Text('Homes'),
      subtitle: Text(
        'Manage your homes here',
        style: getLegendTextStyle(context),
      ),
      initiallyExpanded: true,
      tilePadding: const EdgeInsets.only(top: 16),
      leading: const Icon(Icons.home_work, size: 48),
      trailing: IconButton(
        tooltip: 'Add new home',
        icon: const Icon(Icons.add),
        onPressed: () => homes.add(
          controller.buildHomeFieldsForm(AccountHome(
            name: 'Home ${(homes.value?.length ?? 0) + 1}',
            address: '',
            members: const [],
            services: const [],
          )),
        ),
      ),
      children: [
        ...homes.fieldBuilder<JsonObject>(
          (index, _) => _AccountHomeField(
            index: index,
            homes: homes,
            controller: controller,
            integrations: integrations,
          ),
        )
      ],
    );
  }
}

// Path: homes
class _AccountHomeField extends StatelessWidget {
  const _AccountHomeField({
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
    final home = homes.control('$index');
    final name = home.value[AccountHomeFields.name]!;
    return ExpansionTile(
      title: Text(name),
      subtitle: Text(
        'Manage home setup',
        style: getLegendTextStyle(context),
      ),
      initiallyExpanded: true,
      tilePadding: const EdgeInsets.only(top: 16),
      trailing: IconButton(
        icon: const Icon(Icons.delete),
        onPressed: () async {
          final remove = await showDialog<bool>(
            context: context,
            builder: (BuildContext context) => AlertDialog(
              title: Text('Remove $name'),
              content: const Text(
                'This will remove everything permanently.\n'
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
            homes.removeAt(index);
          }
        },
      ),
      children: [
        SmartDashTextField<String>(
          labelText: 'Name',
          formControlName: '$index.${AccountHomeFields.name}',
          validationMessages: {
            ValidationMessage.required: (_) => 'Please enter home name',
          },
        ),
        _AccountHomeMembersField(
          controller: controller,
          path: '$index.${AccountHomeFields.members}',
          members: homes.control(
            '$index.${AccountHomeFields.members}',
          ) as FormArray<JsonObject>,
        ),
        _AccountHomeServicesField(
          controller: controller,
          integrations: integrations,
          path: '$index.${AccountHomeFields.services}',
          services: homes.control(
            '$index.${AccountHomeFields.services}',
          ) as FormArray<JsonObject>,
        )
      ],
    );
  }
}

// Path: homes.index.members.index
class _AccountHomeMembersField extends ConsumerWidget {
  _AccountHomeMembersField({
    required this.path,
    required this.members,
    required this.controller,
  });

  final String path;
  final FormArray<Object> members;
  final AccountFormScreenController controller;

  final _popupMenuKey = GlobalKey<PopupMenuButtonState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final network = ref.read(networkInfoServiceProvider);
    if (!network.isEnabled) {
      return ExpansionTile(
        title: const Text('Members'),
        subtitle: Text(
          'Presence is disabled',
          style: getLegendTextStyle(context),
        ),
        shape: const Border(),
        collapsedShape: const Border(),
        initiallyExpanded: true,
        tilePadding: const EdgeInsets.only(top: 16),
        leading: const Icon(Icons.home_work, size: 48),
        childrenPadding: EdgeInsets.zero,
        children: const [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [Text('Goto Settings and enable presence')],
            ),
          ),
        ],
      );
    }

    return StreamBuilder<NetworkScanProgress>(
        stream: network.progress,
        initialData: network.getProgress(),
        builder: (context, snapshot) {
          final devices = ref
              .read(networkInfoServiceProvider)
              .devicesCached
              .map(AccountHomeMember.fromDevice)
              .toList();
          final missing = _calcMissing(devices);
          return ExpansionTile(
            title: const Text('Members'),
            subtitle: Text(
              'Let devices track presence',
              style: getLegendTextStyle(context),
            ),
            initiallyExpanded: true,
            tilePadding: const EdgeInsets.only(top: 16),
            trailing: PopupMenuButton<AccountHomeMember>(
              key: _popupMenuKey,
              position: PopupMenuPosition.over,
              constraints: const BoxConstraints(
                minWidth: 400,
              ),
              tooltip: devices.isNotEmpty
                  ? 'Add member to home'
                  : 'No more members to add',
              child: IconButton(
                icon: const Icon(Icons.add),
                onPressed: missing.isNotEmpty
                    ? () => _popupMenuKey.currentState?.showButtonMenu()
                    : null,
              ),
              onSelected: (AccountHomeMember key) {
                members.add(controller.buildMemberFieldsForm(
                  key,
                ));
              },
              itemBuilder: (BuildContext context) {
                return missing
                    .map((e) => PopupMenuItem<AccountHomeMember>(
                          value: e,
                          child: Row(
                            children: [
                              const Icon(Icons.device_unknown),
                              const SizedBox(width: 16),
                              Text(e.name, overflow: TextOverflow.ellipsis),
                            ],
                          ),
                        ))
                    .toList();
              },
            ),
            children: [
              ...members.fieldBuilder(
                (index, value) => _HomeMemberField(
                  path: path,
                  index: index,
                  members: members,
                ),
              ),
            ],
          );
        });
  }

  List<AccountHomeMember> _calcMissing(List<AccountHomeMember> all) {
    final uses = members.value?.whereType<JsonObject>().toSet() ?? {};
    return all.toSet().toList()..removeWhere(uses.contains);
  }
}

// Path: homes.index.services
class _HomeMemberField extends StatefulWidget {
  const _HomeMemberField({
    required this.path,
    required this.index,
    required this.members,
  });

  final int index;
  final String path;
  final FormArray<Object> members;

  @override
  State<_HomeMemberField> createState() => _HomeMemberFieldState();
}

class _HomeMemberFieldState extends State<_HomeMemberField> {
  @override
  Widget build(BuildContext context) {
    final prefix = '${widget.path}.${widget.index}';
    final member = widget.members.value![widget.index] as JsonObject;
    final name = member[AccountHomeMemberFields.name] as String;
    return ExpansionTile(
      title: Text(name),
      subtitle: Text(
        'Click to manage member',
        style: getLegendTextStyle(context),
      ),
      initiallyExpanded: false,
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
            );
          }
        },
      ),
      children: [
        const SizedBox(height: 16.0),
        SmartDashTextField<String>(
          labelText: 'Name',
          formControlName: '$prefix.${AccountHomeMemberFields.name}',
          validationMessages: {
            ValidationMessage.required: (_) => 'Please enter an device name',
          },
        ),
      ],
    );
  }
}

// Path: homes.index.services
class _AccountHomeServicesField extends StatelessWidget {
  _AccountHomeServicesField({
    required this.path,
    required this.services,
    required this.controller,
    required this.integrations,
  });

  final String path;
  final FormArray<Object> services;
  final IntegrationMap integrations;
  final AccountFormScreenController controller;

  final _popupMenuKey = GlobalKey<PopupMenuButtonState>();

  @override
  Widget build(BuildContext context) {
    if (integrations.isEmpty) {
      return ExpansionTile(
        title: const Text('Services'),
        subtitle: Text(
          'Add and configure services',
          style: getLegendTextStyle(context),
        ),
        initiallyExpanded: true,
        shape: const Border(),
        collapsedShape: const Border(),
        tilePadding: const EdgeInsets.only(top: 16),
        childrenPadding: EdgeInsets.zero,
        children: const [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [Text('No services available')],
            ),
          ),
        ],
      );
    }
    return ExpansionTile(
      title: const Text('Services'),
      subtitle: Text(
        'Add and configure services',
        style: getLegendTextStyle(context),
      ),
      initiallyExpanded: true,
      shape: const Border(),
      collapsedShape: const Border(),
      tilePadding: const EdgeInsets.only(top: 16),
      trailing: StreamBuilder<Object>(
          stream: services.collectionChanges,
          builder: (_, __) {
            final (instances, missing) = _calcMissing();
            return PopupMenuButton<String>(
              key: _popupMenuKey,
              position: PopupMenuPosition.over,
              tooltip: missing.isNotEmpty
                  ? 'Add service to home'
                  : 'No more services to add',
              child: IconButton(
                icon: const Icon(Icons.add),
                onPressed: missing.isNotEmpty
                    ? () => _popupMenuKey.currentState?.showButtonMenu()
                    : null,
              ),
              onSelected: (String service) {
                services.add(controller.buildServiceFieldsForm(
                  ServiceConfig.fromDriver(
                    integrations[service]!,
                  ),
                ));
              },
              itemBuilder: (BuildContext context) {
                return missing
                    .map((key) => _buildPopupMenuItem(key, instances))
                    .toList();
              },
            );
          }),
      children: [
        ...services.fieldBuilder<JsonObject>(
          (index, value) => _HomeServiceField(
            path: path,
            index: index,
            services: services,
            integrations: integrations,
            serviceKey: value[ServiceConfigFields.key] as String,
          ),
        ),
      ],
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
    final uses = services.value
            ?.whereType<JsonObject>()
            .map((e) => e[ServiceConfigFields.key])
            .toSet() ??
        {};
    final instances = integrations.map(
      (key, value) => MapEntry(key, value.instances),
    );
    final missing = integrations.keys.toSet()
      ..removeWhere((key) {
        if (uses.contains(key)) {
          if (instances.containsKey(key)) {
            instances[key] = instances[key]! - 1;
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
    required this.path,
    required this.index,
    required this.services,
    required this.serviceKey,
    required this.integrations,
  });

  final int index;
  final String path;
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
    final prefix = '${widget.path}.${widget.index}';
    final service = widget.integrations[widget.serviceKey]!;
    return ExpansionTile(
      title: Text(service.name),
      subtitle: Text(service.description),
      initiallyExpanded: true,
      shape: const Border(),
      collapsedShape: const Border(),
      childrenPadding: EdgeInsets.zero,
      tilePadding: const EdgeInsets.only(top: 16),
      leading: Image.asset(
        'assets/images/${service.image}',
        fit: BoxFit.cover,
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
            );
          }
        },
      ),
      children: [
        if (service.fields.contains(ServiceField.device)) ...[
          const SizedBox(height: 16.0),
          SmartDashTextField<String>(
            labelText: 'Device',
            formControlName: '$prefix.${ServiceConfigFields.device}',
            validationMessages: {
              ValidationMessage.required: (_) => 'Please enter an device name',
            },
          ),
        ],
        if (service.fields.contains(ServiceField.host)) ...[
          const SizedBox(height: 16.0),
          SmartDashTextField<String>(
            labelText: 'Host',
            formControlName: '$prefix.${ServiceConfigFields.host}',
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
            formControlName: '$prefix.${ServiceConfigFields.port}',
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
            formControlName: '$prefix.${ServiceConfigFields.username}',
            validationMessages: {
              ValidationMessage.required: (_) => 'Please enter an username',
            },
          ),
        ],
        if (service.fields.contains(ServiceField.password)) ...[
          const SizedBox(height: 16.0),
          SmartDashTextField<String>(
            labelText: 'Password',
            formControlName: '$prefix.${ServiceConfigFields.password}',
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
