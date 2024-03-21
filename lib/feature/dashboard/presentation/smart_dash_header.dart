import 'package:flutter/material.dart';
import 'package:smart_dash/core/presentation/widget/responsive_widget.dart';

class SmartDashHeader extends StatelessWidget {
  const SmartDashHeader({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: ResponsiveWidget.isAnyMobile(context) ? 48.0 : 0.0,
        bottom: 24,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          const Spacer(flex: 1),
          /*
          if (ResponsiveWidget.isMobile(context))
            PopupMenuButton<String>(
              onSelected: (value) {
                context.push(value);
              },
              itemBuilder: (context) {
                return [];
              },
            )
           */
        ],
      ),
    );
  }
}
