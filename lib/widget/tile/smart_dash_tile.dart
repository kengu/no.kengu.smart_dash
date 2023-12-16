import 'package:flutter/material.dart';
import 'package:smart_dash/scaffold/presentation/app/smart_dash_app_theme_data.dart';

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
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: ListTile(
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
              ),
              const Spacer(),
              body,
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
