import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SmartDashBottomSheet extends StatelessWidget {
  const SmartDashBottomSheet({
    super.key,
    this.width = 300,
    required this.title,
    required this.children,
  });

  final String title;
  final double width;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).bottomSheetTheme;
    return GestureDetector(
      onTap: () => context.pop(),
      child: Container(
        color: Colors.transparent,
        padding: const EdgeInsets.only(left: 90),
        child: Align(
          alignment: Alignment.bottomLeft,
          child: GestureDetector(
            onTap: () {/*Discard*/},
            child: Material(
              elevation: 16.0,
              color: theme.backgroundColor,
              shadowColor: theme.shadowColor,
              surfaceTintColor: theme.surfaceTintColor,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8.0),
                  topRight: Radius.circular(8.0),
                ),
              ),
              child: SizedBox(
                width: width,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 16.0,
                        left: 24.0,
                        bottom: 8.0,
                      ),
                      child: Text(
                        title,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                    ...children,
                    const SizedBox(height: 16.0),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
