import 'package:flutter/material.dart';
import 'package:smart_dash/core/presentation/theme/smart_dash_theme_data.dart';

class SmartDashTile extends StatelessWidget {
  const SmartDashTile({
    super.key,
    required this.body,
    required this.title,
    required this.subTitle,
    required this.leading,
    required this.trailing,
    required this.constraints,
  });

  final Widget body;
  final String title;
  final Widget leading;
  final String subTitle;
  final Widget trailing;

  final BoxConstraints constraints;

  @override
  Widget build(BuildContext context) {
    final surfaceColor = Theme.of(context).navigationRailTheme.backgroundColor!;
    final subTitleColor = surfaceColor.lighten(0.3);
    return Container(
      constraints: constraints,
      child: Material(
        elevation: 4.0,
        child: Container(
          decoration: BoxDecoration(
            color: surfaceColor,
            borderRadius: const BorderRadius.all(Radius.circular(8)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              ListTile(
                dense: true,
                title: Text(
                  title,
                  textScaler: const TextScaler.linear(0.9),
                ),
                subtitle: Text(
                  subTitle,
                  style: TextStyle(color: subTitleColor),
                  textScaler: const TextScaler.linear(0.85),
                ),
                minLeadingWidth: 8,
                style: ListTileStyle.drawer,
                leading: leading,
                trailing: trailing,
              ),
              const Spacer(),
              Expanded(
                flex: 30,
                child: body,
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
