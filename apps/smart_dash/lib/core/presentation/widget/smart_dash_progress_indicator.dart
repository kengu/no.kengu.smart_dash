import 'package:flutter/material.dart';

class SmartDashProgressIndicator extends StatelessWidget {
  const SmartDashProgressIndicator({
    super.key,
    this.message = 'Preparing data',
    this.delay = const Duration(
      milliseconds: 200,
    ),
  });

  /// Message shown below progress indicator
  final String? message;

  /// Use to delays showing progress indication in cases where
  /// the the delay is short in most cases. This can remove
  /// "flickering" seen when progress indicator is shown
  /// in within 150 to 500 ms.
  final Duration delay;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder<bool>(
          initialData: false,
          future: Future.delayed(delay, () => true),
          builder: (context, snapshot) {
            return Visibility(
              visible: snapshot.data == true,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const CircularProgressIndicator(),
                  const SizedBox(height: 16.0),
                  if (message?.isNotEmpty == true) Text(message!),
                ],
              ),
            );
          }),
    );
  }
}
