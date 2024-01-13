import 'package:optional/optional.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_dash/feature/account/data/account_repository.dart';
import 'package:smart_dash/feature/account/domain/account.dart';
import 'package:smart_dash/feature/account/domain/service_definition.dart';
import 'package:smart_dash/widget/form/async_form_controller.dart';
import 'package:smart_dash/widget/load/async_load_controller.dart';

part 'account_form_screen_controller.g.dart';

class AccountQuery {
  AccountQuery({
    required this.userId,
    required Iterable<String> services,
  }) : services = services.toList();

  final String userId;
  final List<String> services;
}

class AccountFormFields {
  static const String services = 'services';
}

@riverpod
class AccountFormScreenController extends _$AccountFormScreenController
    with
        AsyncLoadController<AccountQuery, Account>,
        AsyncFormController<AccountQuery, Account> {
  static List<ServiceDefinition> from(FormArray entries) =>
      entries.value
          ?.whereType<Map<String, Object?>>()
          .map((e) => ServiceDefinition.fromJson(e))
          .toList() ??
      [];

  static int indexWhere(FormArray fromArray, ServiceDefinition service) {
    return fromArray.value!.indexWhere(
      (e) =>
          e[ServiceFields.key] == service.key &&
          e[ServiceFields.device] == service.device,
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
      AccountFormFields.services: FormArray<Object>([
        ...toServices(data).map(buildServiceFieldsForm),
      ]),
    });
  }

  Set<ServiceDefinition> toServices(Optional<Account> data) {
    return data.isPresent
        ? query!.services.map(data.value.all).expand((e) => e.toList()).toSet()
        : {};
  }

  FormGroup buildServiceFieldsForm(ServiceDefinition data) {
    return fb.group(<String, Object>{
      // Hidden fields
      ServiceFields.key: FormControl<String>(
        value: data.key,
      ),
      ServiceFields.name: FormControl<String>(
        value: data.name,
      ),
      ServiceFields.fields: FormControl<List<String>>(
        value: data.fields,
      ),
      // Rendered fields
      if (data.fields.contains('device'))
        ServiceFields.device: FormControl<String>(
          value: data.device,
          validators: [Validators.required],
        ),
      if (data.fields.contains('host'))
        ServiceFields.host: FormControl<String>(
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
      if (data.fields.contains('port'))
        ServiceFields.port: FormControl<int>(
          value: data.port,
          validators: [
            Validators.required,
            Validators.number,
          ],
        ),
      if (data.fields.contains('port'))
        ServiceFields.device: FormControl<String>(
          value: data.device,
          validators: [Validators.required],
        ),
      if (data.fields.contains('username'))
        ServiceFields.username: FormControl<String>(
          value: data.username,
          validators: [Validators.required],
        ),
      if (data.fields.contains('password'))
        ServiceFields.password: FormControl<String>(
          value: data.password,
          validators: [Validators.required],
        )
    });
  }

  @override
  Account buildData(Map<String, Object?> value) =>
      Account.fromJson({...value, AccountFields.userId: query!.userId});

  @override
  Future<Optional<Account>> load() =>
      ref.read(accountRepositoryProvider).get(query!.userId);

  @override
  Future<bool> save(Account data) async {
    return await ref.read(accountRepositoryProvider).addOrUpdate(data);
  }
}
