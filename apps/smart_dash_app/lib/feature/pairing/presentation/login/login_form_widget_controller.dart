// import 'package:optional/optional.dart';
// import 'package:reactive_forms/reactive_forms.dart';
// import 'package:riverpod_annotation/riverpod_annotation.dart';
// import 'package:smart_dash_app/feature/account/data/account_repository.dart';
// import 'package:smart_dash_app/feature/account/domain/account.dart';
// import 'package:smart_dash_app/feature/account/domain/service_config.dart';
// import 'package:smart_dash_app/core/presentation/widget/async_form_controller.dart';
// import 'package:smart_dash_app/core/presentation/widget/async_load_controller.dart';
//
// part '../login_form_screen_controller.g.dart';
//
// class LoginQuery {
//   LoginQuery({
//     required this.userId,
//     required Iterable<String> services,
//   }) : services = services.toList();
//
//   final String userId;
//   final List<String> services;
// }
//
// class LoginFormFields {
//   static const String services = 'services';
// }
//
// @riverpod
// class LoginFormScreenController extends _$LoginFormScreenController
//     with
//         AsyncLoadController<LoginQuery, Login>,
//         AsyncSaveController<LoginQuery, Login> {
//   static List<String> toServiceNames(FormArray<dynamic> entries) =>
//       entries.value
//           ?.whereType<Map>()
//           .map((e) => e[ServiceFields.name] as String)
//           .toList() ??
//       [];
//
//   static int indexWhere(FormArray<dynamic> fromArray, String service) {
//     return fromArray.value!.indexWhere(
//       (e) => e[ServiceFields.name] == service,
//     );
//   }
//
//   @override
//   FutureOr<Optional<Login>> build() => super.build();
//
//   @override
//   FormGroup buildForm(Optional<Login> data) {
//     return fb.group(<String, Object>{
//       LoginFields.fname: FormControl<String>(
//         value: data.orElseNull?.fname,
//         validators: [Validators.required],
//       ),
//       LoginFields.lname: FormControl<String>(
//         value: data.orElseNull?.lname,
//         validators: [Validators.required],
//       ),
//       LoginFormFields.services: FormArray<Object>([
//         ...toServices(data).map(buildCredentialsForm),
//       ]),
//     });
//   }
//
//   Set<Service> toServices(Optional<Login> data) {
//     return data.isPresent
//         ? query!.services
//             .map((service) => data.value.lookup(service))
//             .where((result) => result.isPresent)
//             .map((result) => result.value)
//             .toSet()
//         : {};
//   }
//
//   FormGroup buildCredentialsForm(Service data) {
//     return fb.group(<String, Object>{
//       ServiceFields.name: FormControl<String>(
//         value: data.name,
//       ),
//       ServiceFields.username: FormControl<String>(
//         value: data.name,
//         validators: [Validators.required],
//       ),
//       ServiceFields.password: FormControl<String>(
//         value: data.name,
//         validators: [Validators.required],
//       )
//     });
//   }
//
//   @override
//   Login buildData(Map<String, Object?> value) =>
//       Login.fromJson({...value, LoginFields.userId: query!.userId});
//
//   @override
//   Future<Optional<Login>> load() =>
//       ref.read(accountRepositoryProvider).get(query!.userId);
//
//   @override
//   Future<bool> save(Login data) async {
//     return await ref.read(accountRepositoryProvider).addOrUpdate(data);
//   }
// }
