import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:optional/optional.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_dash/core/presentation/widget/form/async_form_controller.dart';
import 'package:smart_dash/core/presentation/widget/load/async_load_controller.dart';
import 'package:smart_dash_account/smart_dash_account_app.dart';
import 'package:smart_dash_common/smart_dash_common.dart';

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
  static AccountFormScreenController forCurrentUser(WidgetRef ref) {
    final user = ref.read(userRepositoryProvider).currentUser;
    final integrations = ref.read(integrationRepositoryProvider);
    return AsyncFormController.of(
        ref,
        accountFormScreenControllerProvider.call,
        AccountQuery(
          userId: user.userId,
          serviceKeys: integrations.hasValue
              ? integrations.value!.entries
                  .where((e) => !e.value.system)
                  .map((e) => e.key)
              : [],
        )) as AccountFormScreenController;
  }

  @override
  FutureOr<Optional<Account>> build(AccountQuery query) => super.build(query);

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

  FormGroup buildHomeFieldsForm(Home data) {
    return fb.group(<String, Object>{
      // Hidden fields
      HomeFields.id: FormControl<String>(
        value: data.id,
      ),
      // Rendered fields
      HomeFields.name: FormControl<String>(
        value: data.name,
        validators: [Validators.required],
      ),
      HomeFields.location: buildLocationFieldsForm(
        data.location,
      ),
      HomeFields.members: FormArray<JsonObject>([
        ...data.members.map(buildMemberFieldsForm),
      ]),
      HomeFields.services: FormArray<JsonObject>([
        ...toServices(data).map(buildServiceFieldsForm),
      ]),
    });
  }

  FormGroup buildLocationFieldsForm(Location? data) {
    return fb.group(<String, Object>{
      // Hidden fields
      LocationField.data: FormControl<JsonObject>(
        value: data?.data,
      ),
      // Rendered fields
      LocationField.name: FormControl<String>(value: data?.name, validators: [
        Validators.required,
      ]),
      LocationField.lon: FormControl<double>(
        value: data?.lon,
        validators: [
          Validators.required,
          Validators.pattern(r'(^\d*\.?\d*)'),
        ],
      ),
      LocationField.lat: FormControl<double>(
        value: data?.lat,
        validators: [
          Validators.required,
          Validators.pattern(r'(^\d*\.?\d*)'),
        ],
      ),
    });
  }

  FormGroup buildMemberFieldsForm(HomeMember data) {
    return fb.group(<String, Object>{
      // Hidden fields
      HomeMemberFields.key: FormControl<String>(
        value: data.key,
      ),
      // Rendered fields
      HomeMemberFields.name: FormControl<String>(
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
            Validators.number(),
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
        ),
      if (data.fields.contains(ServiceField.topics))
        ServiceConfigFields.topics: FormControl<String>(
          value: data.topics,
          validators: [Validators.required],
        )
    });
  }

  Set<ServiceConfig> toServices(Home data) {
    return query.services
        .map(data.serviceWhere)
        .expand((e) => e.toList())
        .toSet();
  }

  @override
  Account buildData(Map<String, Object?> value) {
    return Account.fromJson({
      ...value,
      AccountFields.userId: query.userId,
    });
  }

  @override
  Future<Optional<Account>> load(AccountQuery query) async {
    final service = ref.read(accountServiceProvider);
    final result = await service.getAccount(userId: query.userId);
    if (result.isPresent) {
      final account = result.value;
      final current = await service.getCurrentHome(userId: query.userId);
      if (current.isPresent) {
        final home = current.value;
        final data = Optional.of(
          account.copyWith(
            homes: account.homes.where((e) => e.id == home.id).toList(),
          ),
        );
        return data;
      }
    }
    return const Optional.empty();
  }

  @override
  Future<bool> save(Account data) {
    return ref.read(accountServiceProvider).addOrUpdate(data);
  }
}
