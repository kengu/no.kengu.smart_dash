import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/material.dart' hide ProgressIndicator;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:smart_dash/feature/account/domain/account.dart';
import 'package:smart_dash/feature/account/domain/service_credentials.dart';
import 'package:smart_dash/feature/identity/data/user_repository.dart';
import 'package:smart_dash/feature/device/data/device_definition_repository.dart';
import 'package:smart_dash/feature/device/domain/driver_definition.dart';
import 'package:smart_dash/widget/form/field/smart_dash_text_field.dart';
import 'package:smart_dash/widget/form/async_form_screen.dart';
import 'package:smart_dash/widget/notice/notice_controller.dart';
import 'package:smart_dash/widget/smart_dash_error_widget.dart';
import 'package:smart_dash/widget/smart_dash_progress_indicator.dart';

import 'account_form_screen_controller.dart';
import 'field/service_credentials_field_group.dart';

class AccountFormScreen extends ConsumerWidget {
  const AccountFormScreen({
    super.key,
    required this.location,
  });

  final String location;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.read(userRepositoryProvider).currentUser;
    return ref.watch(driverDefinitionRepositoryProvider).when(
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
              child: AccountFieldsWidget(
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

class AccountFieldsWidget extends StatelessWidget {
  const AccountFieldsWidget({
    super.key,
    required this.services,
  });

  final DriverDefinitionMap services;

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
          ReactiveFormArray(
            formArrayName: AccountFormFields.services,
            builder: (context, formArray, child) {
              return Column(
                children: AccountFormScreenController.toServiceNames(formArray)
                    .map((service) => ServiceCredentialsFieldGroup(
                          service: service,
                          formArray: formArray,
                          definitions: services,
                        ))
                    .toList(),
              );
            },
          ),
          const SizedBox(height: 56.0),
          AddServiceMenuButton(
            services: services,
          ),
        ],
      ),
    );
  }
}

class AddServiceMenuButton extends StatelessWidget {
  AddServiceMenuButton({
    super.key,
    required this.services,
  });

  final DriverDefinitionMap services;

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
              AccountFormFields.services,
            ) as FormArray;
            final uses = AccountFormScreenController.toServiceNames(formArray);
            final missing = services.keys.toSet()..removeWhere(uses.contains);
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
                formArray.add(controller.buildCredentialsForm(
                  ServiceCredentials.fromService(
                    service,
                  ),
                ));
              },
              itemBuilder: (BuildContext context) {
                return missing
                    .map((name) => PopupMenuItem<String>(
                          value: name,
                          child: Text(services[name]!.name),
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
