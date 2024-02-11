import 'dart:convert';

import 'package:optional/optional.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_dash/feature/account/data/account_repository.dart';
import 'package:smart_dash/feature/account/domain/account.dart';
import 'package:smart_dash/feature/account/domain/service_config.dart';
import 'package:smart_dash/integration/domain/integration.dart';
import 'package:smart_dash/core/presentation/widget/form/async_form_controller.dart';
import 'package:smart_dash/core/presentation/widget/load/async_load_controller.dart';

part 'account_form_screen_controller.g.dart';

class AccountQuery {
  AccountQuery({
    required this.userId,
    required Iterable<String> services,
  }) : services = services.toList();

  final String userId;
  final List<String> services;
}

@riverpod
class AccountFormScreenController extends _$AccountFormScreenController
    with
        AsyncLoadController<AccountQuery, Account>,
        AsyncFormController<AccountQuery, Account> {
  static List<ServiceConfig> from(FormArray entries) =>
      entries.value
          ?.whereType<Map<String, Object?>>()
          .map((e) => ServiceConfig.fromJson(e))
          .toList() ??
      [];

  static int indexWhere(FormArray fromArray, ServiceConfig service) {
    return fromArray.value!.indexWhere(
      (e) =>
          e[ServiceConfigFields.key] == service.key &&
          e[ServiceConfigFields.device] == service.device,
    );
  }

  @override
  FutureOr<Optional<Account>> build() => super.build();

  @override
  FormGroup buildForm(Optional<Account> data) {
    return fb.group(<String, Object>{
      AccountFields.fname: FormControl<String>(
        value: data.orElseNull?.fname,
        validators: [Validators.required],
      ),
      AccountFields.lname: FormControl<String>(
        value: data.orElseNull?.lname,
        validators: [Validators.required],
      ),
      AccountFields.presence: FormControl<String>(
        value: jsonEncode(data.orElseNull?.presence?.toJson()),
      ),
      AccountFields.services: FormArray<Object>([
        ...toServices(data).map(buildServiceFieldsForm),
      ]),
    });
  }

  Set<ServiceConfig> toServices(Optional<Account> data) {
    return data.isPresent
        ? query!.services
            .map(data.value.where)
            .expand((e) => e.toList())
            .toSet()
        : {};
  }

  FormGroup buildServiceFieldsForm(ServiceConfig data) {
    return fb.group(<String, Object>{
      // Hidden fields
      ServiceConfigFields.key: FormControl<String>(
        value: data.key,
      ),
      ServiceConfigFields.name: FormControl<String>(
        value: data.name,
      ),
      ServiceConfigFields.fields: FormControl<List<String>>(
        value: data.fields.map((e) => e.name).toList(),
      ),
      // Rendered fields
      if (data.fields.contains(ServiceField.device))
        ServiceConfigFields.device: FormControl<String>(
          value: data.device,
          validators: [Validators.required],
        ),
      if (data.fields.contains(ServiceField.host))
        ServiceConfigFields.host: FormControl<String>(
          value: data.host,
          validators: [
            Validators.required,
            Validators.pattern(
              r'^(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}'
              r'(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$|^'
              r'(([a-zA-Z0-9]|[a-zA-Z0-9][a-zA-Z0-9\-]*[a-zA-Z0-9])\.)+'
              r'([A-Za-z]|[A-Za-z][A-Za-z0-9\-]*[A-Za-z0-9])$',
            )
          ],
        ),
      if (data.fields.contains(ServiceField.port))
        ServiceConfigFields.port: FormControl<int>(
          value: data.port,
          validators: [
            Validators.required,
            Validators.number,
          ],
        ),
      if (data.fields.contains(ServiceField.username))
        ServiceConfigFields.username: FormControl<String>(
          value: data.username,
          validators: [Validators.required],
        ),
      if (data.fields.contains(ServiceField.password))
        ServiceConfigFields.password: FormControl<String>(
          value: data.password,
          validators: [Validators.required],
        )
    });
  }

  @override
  Account buildData(Map<String, Object?> value) {
    // Not happy with this workaround...
    // It is a result of poor parametric typing in
    // reactive_forms that does not handle objects well.
    // Side note: It is hard to work with reactive_forms
    // using the patterns implemented by SmartDash
    final presence = value[AccountFields.presence] as String?;

    return Account.fromJson({
      ...value,
      AccountFields.userId: query!.userId,
      if (presence != null) AccountFields.presence: jsonDecode(presence),
    });
  }

  @override
  Future<Optional<Account>> load() =>
      ref.read(accountRepositoryProvider).get(query!.userId);

  @override
  Future<bool> save(Account data) async {
    return await ref.read(accountRepositoryProvider).addOrUpdate(data);
  }
}
