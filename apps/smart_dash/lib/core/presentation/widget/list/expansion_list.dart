import 'package:flutter/material.dart';
import 'package:smart_dash/core/presentation/theme/smart_dash_theme_data.dart';

const Duration _kExpand = Duration(milliseconds: 200);

class SmartDashExpansionList<T> extends StatefulWidget {
  const SmartDashExpansionList({
    super.key,
    required this.title,
    this.icon,
    this.trailing,
    this.onPressed,
    this.description,
    this.dense = false,
    this.iconSize = 32,
    this.iconTurns = 0.5,
    this.children = const [],
    this.initiallyExpanded = false,
    this.childPadding = const EdgeInsets.only(bottom: 16.0),
  });

  final bool dense;
  final Widget title;
  final IconData? icon;
  final double iconSize;
  final double iconTurns;
  final IconData? trailing;
  final Widget? description;
  final List<Widget> children;
  final bool initiallyExpanded;
  final EdgeInsets childPadding;
  final VoidCallback? onPressed;

  @override
  State<SmartDashExpansionList<T>> createState() =>
      _SmartDashExpansionListState<T>();
}

class _SmartDashExpansionListState<T> extends State<SmartDashExpansionList<T>>
    with SingleTickerProviderStateMixin {
  static final Animatable<double> _easeInTween =
      CurveTween(curve: Curves.easeIn);
  late Animatable<double> _halfTween;

  bool _isExpanded = false;
  bool _isFullyExpanded = false;
  late Animation<double> _iconTurns;
  late AnimationController _animationController;
  final ExpansionTileController _tileController = ExpansionTileController();

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(duration: _kExpand, vsync: this);
    _animationController.addStatusListener((status) {
      _isFullyExpanded = _isExpanded && status == AnimationStatus.completed;
      if (_isFullyExpanded) {
        setState(() {});
      }
    });

    _halfTween = Tween<double>(begin: 0.0, end: widget.iconTurns);
    _iconTurns = _animationController.drive(_halfTween.chain(_easeInTween));

    _isExpanded = PageStorage.maybeOf(context)?.readState(context) as bool? ??
        widget.initiallyExpanded;
    if (_isExpanded) {
      _animationController.value = 1.0;
    }
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isNested = ExpansionTileController.maybeOf(context) != null;
    return ExpansionTile(
      title: widget.title,
      subtitle: widget.description,
      dense: widget.dense,
      shape: const Border(),
      onExpansionChanged: _set,
      controller: _tileController,
      trailing: _buildIcon(isNested),
      initiallyExpanded: _isExpanded,
      expandedAlignment: Alignment.centerLeft,
      expandedCrossAxisAlignment: CrossAxisAlignment.start,
      tilePadding: const EdgeInsets.all(0),
      childrenPadding: const EdgeInsets.all(0),
      backgroundColor: Theme.of(context).colorScheme.surface.lighten(0.02),
      leading:
          widget.icon == null ? null : Icon(widget.icon, size: widget.iconSize),
      children: widget.children.isEmpty
          ? [
              Padding(
                padding: widget.childPadding,
                child: const Text('No data'),
              )
            ]
          : widget.children
              .map(
                (child) => Padding(
                  padding: widget.childPadding,
                  child: child,
                ),
              )
              .toList(),
    );
  }

  void _set(bool state) {
    setState(() {
      _isExpanded = state;
      if (_isExpanded) {
        _animationController.forward();
      } else {
        _animationController.reverse().then<void>((void value) {
          if (!mounted) {
            return;
          }
          setState(() {
            // Rebuild without widget.children.
          });
        });
      }
      PageStorage.maybeOf(context)?.writeState(context, _isExpanded);
    });
  }

  Widget? _buildIcon(bool isNested) {
    final hasTrailing = widget.onPressed != null;
    final icon = widget.children.isEmpty || _isFullyExpanded
        ? Icon(widget.trailing ?? Icons.expand_more)
        : const Icon(Icons.expand_more);
    return IconButton(
        icon: _isFullyExpanded && hasTrailing
            ? icon
            : RotationTransition(
                turns: _iconTurns,
                alignment: Alignment.center,
                child: icon,
              ),
        onPressed: () {
          if ((widget.children.isEmpty || _isFullyExpanded) && hasTrailing) {
            widget.onPressed?.call();
            if (widget.children.isEmpty) {
              _tileController.expand();
              _set(true);
            }
          } else {
            if (hasTrailing || !_isExpanded) {
              _tileController.expand();
              _set(true);
            } else if (_isExpanded) {
              _tileController.collapse();
              _set(false);
            }
          }
        });
  }
}
