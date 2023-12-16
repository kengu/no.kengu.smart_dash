import 'package:flutter/material.dart';

class SmartDashErrorWidget extends StatelessWidget {
  const SmartDashErrorWidget({
    super.key,
    required this.details,
  });

  factory SmartDashErrorWidget.from(Object error, [StackTrace? stackTrace]) {
    return SmartDashErrorWidget(
        details: FlutterErrorDetails(
      exception: error,
      stack: stackTrace,
    ));
  }

  final FlutterErrorDetails details;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: Colors.red[700],
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                flex: 1,
                child: buildText(details.toString()),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildText(Object text) {
    debugPrint(text.toString());
    return SelectableText(
      text.toString(),
      style: const TextStyle(color: Colors.white),
    );
  }
}
