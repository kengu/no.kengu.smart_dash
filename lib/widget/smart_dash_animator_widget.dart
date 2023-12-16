import 'package:flutter/material.dart';

/// Type definition for builder of [Animation] with value of type [T]
typedef SmartDashAnimationBuilder<T> = Animatable<T> Function(T begin, T end);

/// Type definition for builder of animated widget
typedef SmartDashAnimatedWidgetBuilder<T> = Function(
  BuildContext context,
  Animation<T> animation,
  Widget? child,
);

class SmartDashAnimatorWidget<T> extends StatefulWidget {
  const SmartDashAnimatorWidget({
    super.key,
    required this.data,
    required this.forward,
    required this.builder,
    required this.initialData,
    this.child,
    this.duration = const Duration(seconds: 2),
  });

  final T data;
  final T initialData;
  final Widget? child;
  final Duration duration;
  final SmartDashAnimationBuilder<T> forward;
  final SmartDashAnimatedWidgetBuilder<T> builder;

  @override
  State<SmartDashAnimatorWidget> createState() =>
      _SmartDashAnimatorWidgetState<T>();
}

class _SmartDashAnimatorWidgetState<T> extends State<SmartDashAnimatorWidget<T>>
    with TickerProviderStateMixin {
  late T _initialData;
  Animation<T>? _animation;
  AnimationController? _controller;

  bool get isAnimating =>
      _animation?.status == AnimationStatus.forward ||
      _animation?.status == AnimationStatus.reverse;

  @override
  void initState() {
    super.initState();
    _initialData = widget.initialData;
    _forward(widget.initialData, widget.data);
  }

  @override
  void didUpdateWidget(covariant SmartDashAnimatorWidget<T> oldWidget) {
    if (isAnimating) {
      _forward(_initialData, widget.data);
    } else {
      _forward(oldWidget.data, widget.data);
    }
    super.didUpdateWidget(oldWidget);
  }

  void _forward(T initialData, T data) {
    _initialData = initialData;
    final animatable = widget.forward(initialData, widget.data);
    _controller ??= AnimationController(
      duration: widget.duration,
      vsync: this,
    );
    if (isAnimating) {
      _controller!.stop();
    }

    _animation = animatable.animate(_controller!);
    _controller!.forward();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(context, _animation!, widget.child);
  }
}
