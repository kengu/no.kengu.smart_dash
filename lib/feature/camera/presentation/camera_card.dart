import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:media_kit/media_kit.dart';
import 'package:media_kit_video/media_kit_video.dart';
import 'package:optional/optional.dart';
import 'package:smart_dash/feature/account/domain/service_config.dart';
import 'package:smart_dash/feature/camera/application/camera_manager.dart';
import 'package:smart_dash/feature/camera/domain/camera.dart';
import 'package:smart_dash/core/presentation/theme/smart_dash_theme_data.dart';

class CameraCard extends ConsumerStatefulWidget {
  const CameraCard({
    super.key,
    required this.config,
    this.fit,
    this.onDoubleTap,
    this.cachedWidth,
    this.cachedHeight,
    this.withVideoControl = false,
    this.withMotionControl = false,
    this.withRefreshControl = true,
    this.period = const Duration(seconds: 5),
  });

  final Optional<ServiceConfig> config;

  final Duration period;

  final BoxFit? fit;

  final int? cachedWidth;

  final int? cachedHeight;

  final bool withVideoControl;

  final bool withMotionControl;

  final bool withRefreshControl;

  final VoidCallback? onDoubleTap;

  @override
  ConsumerState<CameraCard> createState() => _VideoCardState();
}

class _VideoCardState extends ConsumerState<CameraCard>
    with SingleTickerProviderStateMixin {
  Timer? _snapshotTimer;

  bool _isUpdating = false;

  late AnimationController _animController;

  // Create a [Player] to control playback.
  late final _videoPlayer = Player();

  // Create a [VideoController] to handle video output from [Player].
  late final _videoController = VideoController(_videoPlayer);

  Optional<Camera> _camera = const Optional.empty();

  bool _isAnimationVisible = false;

  late Optional<(ServiceConfig, String)> _videoConfig;

  bool get isVideoPlaying => _videoPlayer.state.playing;

  @override
  void initState() {
    _startSnapshots();
    _animController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    super.initState();
  }

  @override
  void didUpdateWidget(covariant CameraCard oldWidget) {
    if (widget.period != oldWidget.period) {
      if (isVideoPlaying) {
        _restartVideo();
      } else {
        _startSnapshots();
      }
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    super.dispose();
    _snapshotTimer?.cancel();
    if (isVideoPlaying) {
      unawaited(_videoPlayer.stop());
    }
    _videoPlayer.dispose();
    _animController.dispose();
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
                      onDoubleTap: widget.onDoubleTap,
                      child: Stack(
                        children: [
                          if (isVideoPlaying)
                            Video(controller: _videoController)
                          else
                            Image.memory(
                              snapshot.data!.value.bytes,
                              gaplessPlayback: true,
                              isAntiAlias: true,
                              fit: widget.fit,
                              cacheWidth: widget.cachedWidth,
                              cacheHeight: widget.cachedHeight,
                            ),
                          if (_isAnimationVisible)
                            Positioned(
                              top: 20,
                              right: 20,
                              child: FadeTransition(
                                opacity: _animController,
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
              title: ConstrainedBox(
                constraints: const BoxConstraints(minWidth: 150),
                child: Tooltip(
                  message: 'Updates ever ${widget.period.inSeconds}s',
                  child: Text(
                    widget.config.orElseNull?.device ?? 'Camera',
                    softWrap: false,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              trailing: ConstrainedBox(
                constraints: BoxConstraints.tightFor(
                    width: 200.0 +
                        (widget.withMotionControl ? 100 : 0) +
                        (widget.withRefreshControl ? 76 : 0) +
                        (widget.withVideoControl ? 140 : 0)),
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
                          Tooltip(
                            message: isVideoPlaying
                                ? 'Video is playing'
                                : 'Refresh camera image',
                            child: IconButton(
                              icon: const Icon(Icons.refresh),
                              onPressed: isVideoPlaying ? null : _refresh,
                            ),
                          ),
                        if (widget.withVideoControl) ...[
                          Text(
                            'Video is ${isVideoPlaying ? 'ON' : 'OFF'}',
                          ),
                          Transform.scale(
                            scale: 0.75,
                            child: CupertinoSwitch(
                              activeColor: Colors.blueAccent,
                              value: isVideoPlaying,
                              onChanged: (play) =>
                                  play ? _startVideo() : _stopVideo(),
                            ),
                          ),
                        ]
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

  void _showCircle() {
    setState(() => _isAnimationVisible = true);
    _animController.forward().then((_) {
      Future.delayed(const Duration(milliseconds: 300), () {
        _animController.reverse().then((_) {
          setState(() => _isAnimationVisible = false);
        });
      });
    });
  }

  void _startSnapshots() {
    _snapshotTimer?.cancel();
    _snapshotTimer = Timer.periodic(
      widget.period,
      (timer) => _showCircle(),
    );
  }

  Future<void> _restartVideo() async {
    await _stopVideo();
    await _startVideo();
  }

  Future<void> _startVideo() async {
    assert(!isVideoPlaying, 'Video is already playing');
    if (widget.config.isPresent) {
      final config = widget.config.value;
      final url = 'rtsp://${config.username}:${config.password}'
          '@${config.host}:${config.port}/videoSub';
      _videoConfig = Optional.of((config, url));
      await _videoPlayer.open(Media(url));
      _snapshotTimer?.cancel();
      setState(() {});
      debugPrint(
        'Started RTSP video stream on camera '
        '[${config.device}]: $url',
      );
    }
  }

  Future<void> _stopVideo() async {
    if (isVideoPlaying) {
      debugPrint(_videoPlayer.state.track.video.title);
      await _videoPlayer.stop();
      _startSnapshots();
      setState(() {});
      debugPrint(
        'Stopped RTSP video stream on camera '
        '[${_videoConfig.value.$1.device}]: ${_videoConfig.value.$2}}',
      );
    }
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
