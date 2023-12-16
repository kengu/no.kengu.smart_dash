import 'package:optional/optional.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_dash/feature/account/data/account_repository.dart';
import 'package:smart_dash/feature/account/domain/account.dart';
import 'package:smart_dash/feature/account/domain/service_credentials.dart';
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
  static List<String> toServiceNames(FormArray<dynamic> entries) =>
      entries.value
          ?.whereType<Map>()
          .map((e) => e[ServiceFields.name] as String)
          .toList() ??
      [];

  static int indexWhere(FormArray<dynamic> fromArray, String service) {
    return fromArray.value!.indexWhere(
      (e) => e[ServiceFields.name] == service,
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
        ...toServices(data).map(buildCredentialsForm),
      ]),
    });
  }

  Set<ServiceCredentials> toServices(Optional<Account> data) {
    return data.isPresent
        ? query!.services
            .map((service) => data.value.lookup(service))
            .where((result) => result.isPresent)
            .map((result) => result.value)
            .toSet()
        : {};
  }

  FormGroup buildCredentialsForm(ServiceCredentials data) {
    return fb.group(<String, Object>{
      ServiceFields.name: FormControl<String>(
        value: data.name,
      ),
      ServiceFields.username: FormControl<String>(
        value: data.username,
        validators: [Validators.required],
      ),
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
