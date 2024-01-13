import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:smart_dash/feature/account/domain/service_definition.dart';
import 'package:smart_dash/feature/device/domain/driver_definition.dart';
import 'package:smart_dash/widget/form/field/smart_dash_text_field.dart';

class ServiceFieldGroup extends StatefulWidget {
  const ServiceFieldGroup({
    super.key,
    required this.index,
    required this.service,
    required this.formArray,
    required this.definitions,
  });

  final int index;
  final String service;
  final FormArray<Object> formArray;
  final DriverDefinitionMap definitions;

  @override
  State<ServiceFieldGroup> createState() => _ServiceFieldGroupState();
}

class _ServiceFieldGroupState extends State<ServiceFieldGroup> {
  bool _passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    final service = widget.definitions[widget.service]!;
    return Column(
      children: [
        const SizedBox(height: 56.0),
        ListTile(
          title: Text(service.name),
          subtitle: Text(service.description),
          contentPadding: EdgeInsets.zero,
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
                widget.formArray.removeAt(
                  widget.index,
                );
              }
            },
          ),
        ),
        if (service.fields.contains(ServiceFields.device)) ...[
          const SizedBox(height: 16.0),
          SmartDashTextField<String>(
            formControlName: '${widget.index}.${ServiceFields.device}',
            labelText: 'Device',
            validationMessages: {
              ValidationMessage.required: (_) => 'Please enter an device name',
            },
          ),
        ],
        if (service.fields.contains(ServiceFields.host)) ...[
          const SizedBox(height: 16.0),
          SmartDashTextField<String>(
            formControlName: '${widget.index}.${ServiceFields.host}',
            labelText: 'Host',
            validationMessages: {
              ValidationMessage.required: (_) =>
                  'Please enter an ip address or host name',
              ValidationMessage.pattern: (_) =>
                  'Please enter an ip address or host name',
            },
          ),
        ],
        if (service.fields.contains(ServiceFields.port)) ...[
          const SizedBox(height: 16.0),
          SmartDashTextField<int>(
            formControlName: '${widget.index}.${ServiceFields.port}',
            labelText: 'Port',
            validationMessages: {
              ValidationMessage.required: (_) => 'Please enter a host port',
              ValidationMessage.pattern: (_) => 'Please enter a host port',
            },
          ),
        ],
        if (service.fields.contains(ServiceFields.username)) ...[
          const SizedBox(height: 16.0),
          SmartDashTextField<String>(
            formControlName: '${widget.index}.${ServiceFields.username}',
            labelText: 'Username',
            validationMessages: {
              ValidationMessage.required: (_) => 'Please enter an username',
            },
          ),
        ],
        if (service.fields.contains(ServiceFields.password)) ...[
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