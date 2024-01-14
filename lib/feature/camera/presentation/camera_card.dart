import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:optional/optional.dart';
import 'package:smart_dash/core/presentation/screens.dart';
import 'package:smart_dash/feature/account/domain/service_config.dart';
import 'package:smart_dash/feature/camera/application/camera_manager.dart';
import 'package:smart_dash/feature/camera/domain/camera.dart';
import 'package:smart_dash/core/presentation/theme/smart_dash_theme_data.dart';

class CameraCard extends ConsumerStatefulWidget {
  const CameraCard({
    super.key,
    required this.config,
    this.fit,
    this.cachedWidth,
    this.cachedHeight,
    this.withMotionControl = false,
    this.withRefreshControl = true,
    this.period = const Duration(seconds: 5),
  });

  final Optional<ServiceConfig> config;

  final Duration period;

  final BoxFit? fit;

  final int? cachedWidth;

  final int? cachedHeight;

  final bool withMotionControl;

  final bool withRefreshControl;

  @override
  ConsumerState<CameraCard> createState() => _VideoCardState();
}

class _VideoCardState extends ConsumerState<CameraCard>
    with SingleTickerProviderStateMixin {
  Timer? _timer;

  bool _isUpdating = false;

  late AnimationController _controller;

  Optional<Camera> _camera = const Optional.empty();

  bool _isVisible = false;

  @override
  void initState() {
    _startTimer();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    super.initState();
  }

  void _startTimer() {
    _timer?.cancel();
    _timer = Timer.periodic(
      widget.period,
      (timer) => _showCircle(),
    );
  }

  @override
  void didUpdateWidget(covariant CameraCard oldWidget) {
    if (widget.period != oldWidget.period) {
      _startTimer();
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    super.dispose();
    _timer?.cancel();
    _controller.dispose();
  }

  void _showCircle() {
    setState(() => _isVisible = true);
    _controller.forward().then((_) {
      Future.delayed(const Duration(milliseconds: 300), () {
        _controller.reverse().then((_) {
          setState(() => _isVisible = false);
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ClipRRect(
        clipBehavior: Clip.hardEdge,
        borderRadius: BorderRadius.circular(16),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: FutureBuilder<Optional<CameraSnapshot>>(
                  future: _fetchSnapshot(),
                  initialData: _fetchCachedSnapshot(),
                  builder: (context, snapshot) {
                    if (!(snapshot.hasData && snapshot.data!.isPresent)) {
                      return Container(
                        color: Theme.of(context)
                            .navigationRailTheme
                            .backgroundColor!
                            .lighten(0.05),
                        child: const Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    }
                    return GestureDetector(
                      onDoubleTap: () {
                        context.go(Screens.camera, extra: widget.config);
                      },
                      child: Stack(
                        children: [
                          Image.memory(
                            snapshot.data!.value.bytes,
                            gaplessPlayback: true,
                            isAntiAlias: true,
                            fit: widget.fit,
                            cacheWidth: widget.cachedWidth,
                            cacheHeight: widget.cachedHeight,
                          ),
                          if (_isVisible)
                            Positioned(
                              top: 20,
                              right: 20,
                              child: FadeTransition(
                                opacity: _controller,
                                child: Container(
                                  width: 16,
                                  height: 16,
                                  decoration: BoxDecoration(
                                    color: Colors.green.withOpacity(0.5),
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                    );
                  }),
            ),
            ListTile(
              leading: const Icon(
                Icons.video_camera_back_outlined,
              ),
              title: Tooltip(
                message: 'Updates ever ${widget.period.inSeconds}s',
                child: Text(
                  widget.config.orElseNull?.device ?? 'Camera',
                ),
              ),
              trailing: SizedBox(
                width: 250,
                height: 50,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        const Text('Motion Detection'),
                        FutureBuilder<Optional<Camera>>(
                          initialData: _camera,
                          future: _fetchCamera(),
                          builder: (context, updating) {
                            final state =
                                _camera.orElseNull?.motion?.enabled == true;
                            return widget.withMotionControl
                                ? Transform.scale(
                                    scale: 0.75,
                                    child: CupertinoSwitch(
                                      activeColor: Colors.blueAccent,
                                      value: state,
                                      onChanged:
                                          _isUpdating ? null : _setMotionConfig,
                                    ),
                                  )
                                : Text(' is ${state ? 'ON' : 'OFF'}');
                          },
                        ),
                        if (widget.withRefreshControl)
                          IconButton(
                            icon: const Icon(Icons.refresh),
                            onPressed: _refresh,
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _refresh() async {
    await _fetchCamera(ttl: Duration.zero);
    if (mounted) {
      setState(_showCircle);
    }
  }

  Future<Optional<Camera>> _fetchCamera({Duration? ttl}) async {
    if (!widget.config.isPresent) return const Optional.empty();
    _camera = await ref
        .read(cameraManagerProvider)
        .getCamera(widget.config.value, ttl: ttl);
    return _camera;
  }

  Future<Optional<CameraSnapshot>> _fetchSnapshot() async {
    await _fetchCamera();
    if (!_camera.isPresent) return const Optional.empty();
    return ref.read(cameraManagerProvider).getSnapshot(
          _camera.value,
        );
  }

  Optional<CameraSnapshot> _fetchCachedSnapshot() {
    if (!_camera.isPresent) return const Optional.empty();
    return ref.read(cameraManagerProvider).getCachedSnapshot(
          _camera.value,
        );
  }

  void _setMotionConfig(bool enabled) {
    if (_camera.isPresent) {
      // Assume success
      _camera = Optional.of(_camera.value.copyWith(
        motion: _camera.value.motion!.copyWith(
          enabled: enabled,
        ),
      ));

      setState(() {
        // This will disable switch on next build
        _isUpdating = true;
      });

      update() async {
        final result = await ref
            .read(cameraManagerProvider)
            .setMotionConfig(_camera.value, enabled: enabled);

        if (result.isPresent) {
          _camera = Optional.of(_camera.value.copyWith(
            motion: result.value.copyWith(
              enabled: enabled,
            ),
          ));
        }
        if (mounted) {
          setState(() {
            // This will enable switch on next build
            _isUpdating = false;
          });
        }
      }

      unawaited(update());
    }
  }
}
