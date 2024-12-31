// import 'dart:convert';
//
// import 'package:flutter/material.dart';
// import 'package:flutter/material.dart' hide ProgressIndicator;
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:go_router/go_router.dart';
// import 'package:reactive_forms/reactive_forms.dart';
// import 'package:smart_dash_app/feature/account/domain/account.dart';
// import 'package:smart_dash_app/feature/account/domain/service_config.dart';
// import 'package:smart_dash_app/util/integration.dart';
// import 'package:smart_dash_app/core/presentation/widget/state/smart_dash_state.dart';
// import 'package:smart_dash_app/core/presentation/widget/notice/snackbar_controller.dart';
// import 'package:smart_dash_app/core/presentation/widget/smart_dash_error_widget.dart';
// import 'package:smart_dash_app/core/presentation/widget/smart_dash_progress_indicator.dart';
//
// class LoginFormScreen extends ConsumerWidget {
//   const LoginFormScreen({
//     Key? key,
//     required this.userId,
//     required this.location,
//   }) : super(key: key);
//
//   final String userId;
//
//   final String location;
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     return ref.watch(serviceDefinitionsProvider).when(
//           data: (services) {
//             return SmartDashFormScreen<AccountQuery, Account>(
//               title: 'Edit account',
//               scrollable: true,
//               query: AccountQuery(
//                 userId: userId,
//                 services: services.keys,
//               ),
//               provider: accountFormScreenControllerProvider,
//               onCancel: () => context.go(location),
//               onSubmitted: (account) => NoticeController.showSnackBarByRef(
//                 context,
//                 ref,
//                 'Saved account for ${jsonEncode(account.fullName)}',
//                 location: location,
//               ),
//               child: EditAccountWidget(
//                 services: services,
//               ),
//             );
//           },
//           error: SmartDashErrorWidget.from,
//           loading: () => const SmartDashProgressIndicator(
//             message: 'Preparing data',
//           ),
//         );
//   }
// }
//
// class EditAccountWidget extends StatelessWidget {
//   const EditAccountWidget({
//     Key? key,
//     required this.services,
//   }) : super(key: key);
//
//   final ServiceDefinitionMap services;
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         SmartDashTextField<String>(
//           formControlName: AccountFields.fname,
//           labelText: 'First name',
//           validationMessages: {
//             ValidationMessage.required: (_) => 'Please enter firstname',
//           },
//         ),
//         const SizedBox(height: 16.0),
//         SmartDashTextField<String>(
//           formControlName: AccountFields.lname,
//           labelText: 'Last name',
//           validationMessages: {
//             ValidationMessage.required: (_) => 'Please enter lastname',
//           },
//         ),
//         ReactiveFormArray(
//           formArrayName: LoginFormFields.services,
//           builder: (context, formArray, child) {
//             return Column(
//               children: LoginFormScreenController.toServiceNames(formArray)
//                   .map((service) => ServiceCredentialsFieldGroup(
//                         service: service,
//                         formArray: formArray,
//                         definitions: services,
//                       ))
//                   .toList(),
//             );
//           },
//         ),
//         const SizedBox(height: 56.0),
//         AddServiceMenuButton(
//           services: services,
//         ),
//       ],
//     );
//   }
// }
//
// class AddServiceMenuButton extends StatelessWidget {
//   AddServiceMenuButton({
//     Key? key,
//     required this.services,
//   }) : super(key: key);
//
//   final ServiceDefinitionMap services;
//
//   final _popupMenuKey = GlobalKey<PopupMenuButtonState>();
//
//   @override
//   Widget build(BuildContext context) {
//     return Consumer(
//       builder: (context, ref, child) {
//         return ReactiveFormConsumer(
//           builder: (context, form, child) {
//             final controller = ref.read(
//               accountFormScreenControllerProvider.notifier,
//             );
//             final formArray = form.control(
//               LoginFormFields.services,
//             ) as FormArray;
//             final uses = LoginFormScreenController.toServiceNames(formArray);
//             final missing = services.keys.toSet()..removeWhere(uses.contains);
//             return PopupMenuButton<String>(
//               key: _popupMenuKey,
//               position: PopupMenuPosition.over,
//               tooltip: missing.isNotEmpty
//                   ? 'Add service to account'
//                   : 'No more services to add',
//               child: ElevatedButton(
//                 onPressed: missing.isNotEmpty
//                     ? () => _popupMenuKey.currentState?.showButtonMenu()
//                     : null,
//                 child: const Text('ADD SERVICE'),
//               ),
//               onSelected: (String service) {
//                 formArray.add(controller.buildCredentialsForm(
//                   Service.fromService(
//                     service,
//                   ),
//                 ));
//               },
//               itemBuilder: (BuildContext context) {
//                 return missing
//                     .map((name) => PopupMenuItem<String>(
//                           value: name,
//                           child: Text(services[name]!.name),
//                         ))
//                     .toList();
//               },
//             );
//           },
//         );
//       },
//     );
//   }
// }
