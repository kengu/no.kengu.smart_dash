import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:smart_dash/feature/account/domain/service_credentials.dart';
import 'package:smart_dash/feature/account/presentation/account_form_screen_controller.dart';
import 'package:smart_dash/feature/device/domain/driver_definition.dart';
import 'package:smart_dash/widget/form/field/smart_dash_text_field.dart';

class ServiceCredentialsFieldGroup extends StatefulWidget {
  ServiceCredentialsFieldGroup({
    super.key,
    required this.service,
    required this.formArray,
    required this.definitions,
  })  : index = AccountFormScreenController.indexWhere(
          formArray,
          service,
        );

  final int index;
  final String service;
  final FormArray formArray;
  final DriverDefinitionMap definitions;

  @override
  State<ServiceCredentialsFieldGroup> createState() =>
      _ServiceCredentialsFieldGroupState();
}

class _ServiceCredentialsFieldGroupState
    extends State<ServiceCredentialsFieldGroup> {
  bool _passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 56.0),
        ListTile(
          title: Text(widget.definitions[widget.service]!.name),
          subtitle: Text(widget.definitions[widget.service]!.description),
          contentPadding: EdgeInsets.zero,
          leading: Image.asset(
            'assets/images/${widget.definitions[widget.service]!.image}',
            fit: BoxFit.cover,
          ),
          trailing: IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () async {
              final remove = await showDialog<bool>(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  title: Text(
                      'Remove ${widget.definitions[widget.service]!.name}'),
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
                widget.formArray
                    .removeAt(AccountFormScreenController.indexWhere(
                  widget.formArray,
                  widget.service,
                ));
              }
            },
          ),
        ),
        const SizedBox(height: 16.0),
        SmartDashTextField<String>(
          formControlName: '${widget.index}.${ServiceFields.username}',
          labelText: 'Username',
          validationMessages: {
            ValidationMessage.required: (_) => 'Please enter an username',
          },
        ),
        const SizedBox(height: 16.0),
        SmartDashTextField<String>(
          formControlName: '${widget.index}.${ServiceFields.password}',
          labelText: 'Password',
          obscureText: !_passwordVisible,
          validationMessages: {
            ValidationMessage.required: (_) => 'Please enter an password',
          },
          suffixIcon: _buildVisibility(),
          textInputAction: TextInputAction.send,
        ),
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
