import 'dart:async';

import 'package:flutter/material.dart';
import 'package:optional/optional.dart';
import 'package:stream_transform/stream_transform.dart';
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

Future<Optional<T>> showSearchDialog<T>(
  BuildContext context, {
  required String title,
  required Stream<T> Function(String query) search,
  required ListTile Function(T result, bool selected) resultBuilder,
  String? hint,
  String? query,
}) async {
  final streamController = StreamController<StateSetter>.broadcast();
  final subscription = streamController.stream
      .throttle(const Duration(milliseconds: 200))
      .listen((setState) => setState(() {}));
  final result = await showDialog<T>(
    context: context,
    builder: (context) {
      T? selected;
      bool isValid = false;
      final textController = TextEditingController(text: query);
      return StatefulBuilder(builder: (context, setState) {
        final results = <T>{};
        isValid = selected != null;
        return AlertDialog(
          title: Text(title),
          content: SingleChildScrollView(
            child: SizedBox(
              width: double.infinity,
              child: StreamBuilder<T>(
                  stream: search(textController.text),
                  builder: (context, snapshot) {
                    final result = snapshot.data;
                    if (result != null) results.add(result);
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextFormField(
                          autofocus: true,
                          controller: textController,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            hintText: hint,
                            icon: const Icon(Icons.location_city),
                          ),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            isValid = value?.isNotEmpty == true;
                            return isValid ? null : 'Please enter a value';
                          },
                          onChanged: (value) {
                            streamController.add(setState);
                          },
                          onFieldSubmitted: (value) {
                            streamController.add(setState);
                          },
                        ),
                        ...results.map((e) => GestureDetector(
                              child: resultBuilder(e, selected == e),
                              onTap: () => setState(() {
                                selected = e;
                              }),
                            )),
                      ],
                    );
                  }),
            ),
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                textController.dispose();
                Navigator.of(context).pop();
              },
              child: const Text('CANCEL'),
            ),
            ElevatedButton(
              onPressed: isValid
                  ? () {
                      textController.dispose();
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
  subscription.cancel();
  streamController.close();
  return Optional.ofNullable(result);
}
