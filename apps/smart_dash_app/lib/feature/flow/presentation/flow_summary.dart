import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_dash_app/core/presentation/theme/smart_dash_theme_data.dart';
import 'package:smart_dash_app/feature/device/application/device_service.dart';
import 'package:smart_dash_common/smart_dash_common.dart';
import 'package:smart_dash_flow/smart_dash_flow.dart';

/// Human readable flow summary
class FlowSummary extends ConsumerWidget {
  const FlowSummary({
    super.key,
    required this.model,
    this.inGray = false,
    this.enabled = true,
    this.contentPadding = const EdgeInsets.all(24.0),
  });

  final bool inGray;
  final bool enabled;
  final BlockModel model;
  final EdgeInsets contentPadding;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final normal = _toTextStyle(context);
    final bold = normal.copyWith(fontWeight: FontWeight.w600);
    final gray = enabled ? Colors.grey.shade600 : Colors.grey.shade700;
    final inGray = !enabled || this.inGray;
    final red = inGray ? gray : Colors.red.shade600;
    final blue = inGray ? gray : Colors.blue.shade600;
    final brown = inGray ? gray : Colors.brown.lighten(0.1);
    final green = inGray ? gray : Colors.green.lighten(0.1);
    final trigger = model.trigger;
    final types = trigger.onTypes.map((e) => e.name);
    final willSkip = this.willSkip(trigger);
    final hasActions = model.whenTrue.length > 1 || model.whenFalse.length > 1;
    final or = Text('OR', style: bold);
    final and = Text('AND', style: bold);
    // TODO: Implement Token Manager for all tokens
    final manager = ref.read(deviceServiceProvider);
    return FutureBuilder<List<Token>>(
        future: manager.getTokens(),
        initialData: manager.getCachedTokens().orElseNull,
        builder: (context, snapshot) {
          final tags = _toTags(snapshot);
          return Padding(
            padding: contentPadding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildLine(
                  [
                    _buildChip('Active', normal, green),
                    Text('when', style: bold),
                    _buildChip('event', normal, gray),
                    if (types.isNotEmpty) ...[
                      Text(types.length == 1 ? 'of type' : 'with types',
                          style: bold),
                      ...types.map((e) => _buildChip(e, normal, brown)),
                    ],
                    if (tags.isNotEmpty || types.isNotEmpty) and,
                    if (tags.isNotEmpty) ...[
                      Text(tags.length == 1 ? 'with tag' : 'with tags',
                          style: bold),
                      ...tags.map((e) => _buildChip(e, normal, brown)),
                    ],
                    Text('happens', style: bold),
                    if (model.conditions.isNotEmpty) and,
                  ],
                ),
                if (model.conditions.isNotEmpty) ...[
                  for (final e in model.conditions) ...[
                    const SizedBox(height: 8.0),
                    _buildLine(
                      [
                        _buildChip('condition', normal, gray),
                        _buildChip(e.expression, normal, brown),
                        Text('is', style: bold),
                        _buildChip('TRUE', normal, blue),
                      ],
                    )
                  ],
                ],
                if (model.whenTrue.isNotEmpty) ...[
                  const SizedBox(height: 8.0),
                  _buildLine(
                    [
                      _buildChip('Active', normal, green),
                      Text('triggers', style: bold),
                      for (final e in model.whenTrue) ...[
                        _buildChip(e.label, normal, brown),
                      ],
                    ],
                  ),
                ],
                if (model.whenFalse.isNotEmpty) ...[
                  const SizedBox(height: 8.0),
                  _buildLine(
                    [
                      _buildChip('Inactive', normal, red),
                      Text('triggers', style: bold),
                      for (final e in model.whenFalse) ...[
                        _buildChip(e.label, normal, brown),
                      ],
                    ],
                  ),
                ],
                if (willSkip) ...[
                  const SizedBox(height: 8.0),
                  _buildLine(
                    [
                      _buildChip(
                          hasActions ? 'Actions' : 'Action', normal, gray),
                      Text('${hasActions ? 'are' : 'is '} skipped',
                          style: bold),
                      if (trigger.debounceCount > 0) ...[
                        _buildChip('${trigger.debounceCount}', normal, blue),
                        Text('times', style: bold)
                      ],
                      if (willSkip) or,
                      if (trigger.debounceAfter > 0) ...[
                        Text('for', style: bold),
                        _buildChip('${trigger.debounceAfter}s', normal, blue),
                      ],
                    ],
                  )
                ],
                const SizedBox(height: 8.0),
                _buildLine(
                  [
                    _buildChip(hasActions ? 'Actions' : 'Action', normal, gray),
                    Text('${hasActions ? 'are' : 'is '} repeated', style: bold),
                    if (trigger.repeatCount > 0) ...[
                      _buildChip('${trigger.repeatCount}', normal, blue),
                      Text('times', style: bold)
                    ],
                    if (trigger.repeatCount > 0 && trigger.repeatAfter > 0) or,
                    if (trigger.repeatAfter > 0) ...[
                      Text('after', style: bold),
                      _buildChip('${trigger.repeatAfter}s', normal, blue),
                    ],
                  ],
                ),
              ],
            ),
          );
        });
  }

  bool willSkip(BlockTrigger trigger) =>
      trigger.debounceCount > 0 && trigger.debounceAfter > 0;

  Iterable<String> _toTags(AsyncSnapshot<List<Token>> snapshot) {
    final tags = model.trigger.onTags.map((e) => e);
    if (snapshot.hasData) {
      final named = <String>[];
      final tokens = Map.fromEntries(snapshot.data!.map(
        (e) => MapEntry(e.name, e),
      ));
      for (final name in tags) {
        final token = tokens[name];
        final parts = name.split(':');
        if (parts.length == 4) {
          named.add(name);
        } else {
          named.add(token?.tag ?? name);
        }
      }
      return named;
    }
    return tags;
  }

  Wrap _buildLine(List<Widget> children) {
    return Wrap(
      spacing: 8.0,
      runSpacing: 8.0,
      alignment: WrapAlignment.start,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: children,
    );
  }

  Chip _buildChip(String text, TextStyle style, Color color) {
    return Chip(
      elevation: 0.0,
      padding: EdgeInsets.zero,
      label: Text(text, style: style),
      visualDensity: VisualDensity.compact,
      backgroundColor: color,
    );
  }

  TextStyle _toTextStyle(BuildContext context) {
    final surfaceColor = Theme.of(context).navigationRailTheme.backgroundColor!;
    final legendTextColor =
        enabled ? surfaceColor.lighten(0.70) : surfaceColor.lighten(0.60);
    final style = Theme.of(context)
        .textTheme
        .labelMedium!
        .copyWith(color: legendTextColor);
    return style;
  }
}
