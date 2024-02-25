import 'package:flutter/material.dart';

Future<String?> showTextInputDialog(
  BuildContext context, {
  required String title,
  String? hint,
  ValueSetter<String>? onOK,
}) =>
    showDialog<String>(
      context: context,
      builder: (context) {
        final controller = TextEditingController();
        return AlertDialog(
          title: Text(title),
          content: SingleChildScrollView(
            child: SizedBox(
              width: double.infinity,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    autofocus: true,
                    controller: controller,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      hintText: hint,
                      icon: const Icon(Icons.note_add),
                    ),
                  )
                ],
              ),
            ),
          ),
          actions: [
            ElevatedButton(
              child: const Text('CANCEL'),
              onPressed: () {
                controller.dispose();
                Navigator.of(context).pop();
              },
            ),
            ElevatedButton(
              child: const Text('OK'),
              onPressed: () {
                controller.dispose();
                Navigator.of(context).pop(controller.text);
              },
            ),
          ],
        );
      },
    );
