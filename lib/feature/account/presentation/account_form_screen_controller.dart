import 'package:optional/optional.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_dash/feature/account/data/account_repository.dart';
import 'package:smart_dash/feature/account/domain/account.dart';
import 'package:smart_dash/feature/account/domain/service_config.dart';
import 'package:smart_dash/integration/domain/integration.dart';
import 'package:smart_dash/core/presentation/widget/form/async_form_controller.dart';
import 'package:smart_dash/core/presentation/widget/load/async_load_controller.dart';
import 'package:smart_dash/util/data/json.dart';

part 'account_form_screen_controller.g.dart';

class AccountQuery {
  AccountQuery({
    required this.userId,
    required Iterable<String> serviceKeys,
  }) : services = serviceKeys.toList();

  final String userId;
  final List<String> services;
}

@riverpod
class AccountFormScreenController extends _$AccountFormScreenController
    with
        AsyncLoadController<AccountQuery, Account>,
        AsyncFormController<AccountQuery, Account> {
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
      AccountFields.homes: FormArray<JsonObject>([
        ...(data.orElseNull?.homes ?? []).map(buildHomeFieldsForm),
      ]),
    });
  }

  FormGroup buildHomeFieldsForm(AccountHome data) {
    return fb.group(<String, Object>{
      AccountHomeFields.name: FormControl<String>(
        value: data.name,
      ),
      AccountHomeFields.members: FormArray<JsonObject>([
        ...data.members.map(buildMemberFieldsForm),
      ]),
      AccountHomeFields.services: FormArray<JsonObject>([
        ...toServices(data).map(buildServiceFieldsForm),
      ]),
    });
  }

  FormGroup buildMemberFieldsForm(AccountHomeMember data) {
    return fb.group(<String, Object>{
      // Hidden fields
      AccountHomeMemberFields.key: FormControl<String>(
        value: data.key,
      ),
      // Rendered fields
      AccountHomeMemberFields.name: FormControl<String>(
        value: data.name,
      ),
    });
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

  Set<ServiceConfig> toServices(AccountHome data) {
    return query!.services
        .map(data.serviceWhere)
        .expand((e) => e.toList())
        .toSet();
  }

  @override
  Account buildData(Map<String, Object?> value) {
    return Account.fromJson({
      ...value,
      AccountFields.userId: query!.userId,
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
