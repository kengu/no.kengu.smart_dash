import 'package:flutter/material.dart';
import 'package:strings/strings.dart';

Future<String?> showAlertDialog(
  BuildContext context, {
  required String title,
  required String message,
}) {
  return showDialog<String>(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(title),
        content: SizedBox(
          width: double.infinity,
          child: Text(message),
        ),
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('OK'),
          ),
        ],
      );
    },
  );
}

Future<String?> showTextInputDialog(
  BuildContext context, {
  required String title,
  String? hint,
}) {
  return showDialog<String>(
    context: context,
    builder: (context) {
      bool isValid = false;
      final controller = TextEditingController();
      return StatefulBuilder(builder: (context, setState) {
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
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      isValid = value?.isNotEmpty == true;
                      return isValid ? null : 'Please enter a value';
                    },
                    onChanged: (value) => setState(() {
                      isValid = value.isNotEmpty;
                    }),
                    onFieldSubmitted: (value) => setState(() {
                      isValid = value.isNotEmpty;
                    }),
                  )
                ],
              ),
            ),
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                controller.dispose();
                Navigator.of(context).pop();
              },
              child: const Text('CANCEL'),
            ),
            ElevatedButton(
              onPressed: isValid
                  ? () {
                      controller.dispose();
                      Navigator.of(context).pop(controller.text);
                    }
                  : null,
              child: const Text('OK'),
            ),
          ],
        );
      });
    },
  );
}

Future<T?> showSelectInputDialog<T>(
  BuildContext context, {
  required String title,
  required String hint,
  required Map<T, String> items,
}) {
  return showDialog<T>(
    context: context,
    builder: (context) {
      T? selected;
      return StatefulBuilder(builder: (context, setState) {
        return AlertDialog(
          title: Text(title),
          content: SingleChildScrollView(
            child: SizedBox(
              width: double.infinity,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  DropdownButtonFormField<T>(
                    hint: Text(hint),
                    items: items.keys
                        .map((key) => DropdownMenuItem(
                              value: key,
                              child: Text(
                                items[key]!.toCapitalised(),
                              ),
                            ))
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        selected = value;
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('CANCEL'),
            ),
            ElevatedButton(
              onPressed: selected != null
                  ? () {
                      Navigator.of(context).pop(selected);
                    }
                  : null,
              child: const Text('OK'),
            ),
          ],
        );
      });
    },
  );
}

Future<bool?> showPromptDialog(
  BuildContext context, {
  required String title,
  String prompt = 'Do you want to proceed?',
  String? hint,
}) {
  return showDialog<bool>(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      title: Text(title),
      content: Text(prompt),
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
}
