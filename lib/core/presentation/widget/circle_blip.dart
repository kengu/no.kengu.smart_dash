import 'package:flutter/material.dart';

class CircleBlip extends StatefulWidget {
  const CircleBlip({
    super.key,
    required this.enabled,
    this.child,
    this.color,
    this.debounce = 0,
  });

  final Color? color;
  final bool enabled;

  final int debounce;

  final Widget? child;

  @override
  State<CircleBlip> createState() => _CircleBlipState();
}

class _CircleBlipState extends State<CircleBlip>
    with SingleTickerProviderStateMixin {
  static final _defaultColor = Colors.green.withOpacity(0.7);

  late AnimationController _animController;

  bool _isVisible = false;
  DateTime lastBlip = DateTime.now();

  @override
  void initState() {
    _isVisible = widget.enabled;
    _animController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _showCircle(_isVisible);
    super.initState();
  }

  @override
  void didUpdateWidget(covariant CircleBlip oldWidget) {
    _showCircle(widget.enabled);
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _animController.dispose();
    super.dispose();
  }

  void _showCircle(bool state) {
    final now = DateTime.now();
    if (widget.debounce == 0 ||
        now.difference(lastBlip).inSeconds > widget.debounce) {
      lastBlip = now;
      setState(() => _isVisible = state);
      _animController.forward().then((_) {
        Future.delayed(const Duration(milliseconds: 300), () {
          _animController.reverse().then((_) {
            setState(() => _isVisible = false);
          });
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return _isVisible
        ? widget.child == null
            ? _buildCircle()
            : Stack(
                children: [
                  Positioned(
                    top: 8,
                    right: 8,
                    child: _buildCircle(),
                  ),
                  widget.child!,
                ],
              )
        : Container(
            child: widget.child,
          );
  }

  FadeTransition _buildCircle() {
    return FadeTransition(
      opacity: _animController,
      child: Container(
        width: 16,
        height: 16,
        decoration: BoxDecoration(
          color: widget.color ?? _defaultColor,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
