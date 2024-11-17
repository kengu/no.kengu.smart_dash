import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logging/logging.dart';
import 'package:media_kit/media_kit.dart';
import 'package:media_kit_video/media_kit_video.dart';
import 'package:optional/optional.dart';
import 'package:smart_dash_account/smart_dash_account.dart';
import 'package:smart_dash_app/core/presentation/widget/circle_blip.dart';
import 'package:smart_dash_app/feature/camera/application/camera_service.dart';
import 'package:smart_dash_app/feature/camera/domain/camera.dart';

class CameraCard extends ConsumerStatefulWidget {
  const CameraCard({
    super.key,
    required this.config,
    this.fit,
    this.onDoubleTap,
    this.cachedWidth,
    this.cachedHeight,
    this.isUpdating = false,
    this.withVideoControl = false,
    this.withMotionControl = false,
    this.withRefreshControl = true,
    this.period = const Duration(seconds: 5),
  });

  final Optional<ServiceConfig> config;

  final Duration period;

  final BoxFit? fit;

  final bool isUpdating;

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

  // Create a [Player] to control playback.
  late final _videoPlayer = Player();

  // Create a [VideoController] to handle video output from [Player].
  late final _videoController = VideoController(_videoPlayer);

  Optional<Camera> _camera = const Optional.empty();
  late Optional<(ServiceConfig, String)> _videoConfig;

  bool get isVideoPlaying => _videoPlayer.state.playing;

  @override
  void initState() {
    _startSnapshots();
    _isUpdating = widget.isUpdating;
    super.initState();
  }

  @override
  void didUpdateWidget(covariant CameraCard oldWidget) {
    _isUpdating = widget.isUpdating;
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
    _snapshotTimer?.cancel();
    if (isVideoPlaying) {
      unawaited(_videoPlayer.stop());
    }
    _videoPlayer.dispose();
    super.dispose();
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
                        color: Theme.of(context).cardColor,
                        child: const Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    }
                    return GestureDetector(
                      onDoubleTap: widget.onDoubleTap,
                      child: Container(
                        color: Theme.of(context).cardColor,
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
                            if (!_isUpdating &&
                                ConnectionState.done ==
                                    snapshot.connectionState)
                              Positioned(
                                top: 8,
                                right: 8,
                                child: CircleBlip(
                                  enabled: !isVideoPlaying,
                                ),
                              ),
                          ],
                        ),
                      ),
                    );
                  }),
            ),
            ListTile(
              leading: const Icon(
                Icons.video_camera_back_outlined,
              ),
              contentPadding: const EdgeInsets.only(left: 16.0, right: 4.0),
              title: Tooltip(
                message: 'Updates ever ${widget.period.inSeconds}s',
                child: Text(
                  widget.config.orElseNull?.id ?? 'Camera',
                  softWrap: false,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              trailing: ConstrainedBox(
                constraints: BoxConstraints.tightFor(
                    width: 110.0 +
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

  void _startSnapshots() {
    _snapshotTimer?.cancel();
    _snapshotTimer = Timer.periodic(
      widget.period,
      (timer) {
        setState(() {});
      },
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
          '@${config.host}:${config.port}/videoMain';
      _videoConfig = Optional.of((config, url));
      await _videoPlayer.open(Media(url));
      _snapshotTimer?.cancel();
      setState(() {});
      Logger('$runtimeType').fine(
        'Started RTSP video stream on camera '
        '[${config.id}]: $url',
      );
    }
  }

  Future<void> _stopVideo() async {
    if (isVideoPlaying) {
      await _videoPlayer.stop();
      _startSnapshots();
      setState(() {});
      Logger('$runtimeType').fine(
        'Stopped RTSP video stream on camera '
        '[${_videoConfig.value.$1.id}]: ${_videoConfig.value.$2}}',
      );
    }
  }

  Future<void> _refresh() async {
    await _fetchCamera(ttl: Duration.zero);
    if (mounted) {
      setState(() {});
    }
  }

  Future<Optional<Camera>> _fetchCamera({Duration? ttl}) async {
    if (!widget.config.isPresent) return const Optional.empty();
    _camera = await ref
        .read(cameraServiceProvider)
        .getCamera(widget.config.value, ttl: ttl);
    return _camera;
  }

  Future<Optional<CameraSnapshot>> _fetchSnapshot() async {
    await _fetchCamera(ttl: widget.period);
    if (!_camera.isPresent) return const Optional.empty();
    return ref.read(cameraServiceProvider).getSnapshot(
          _camera.value,
          ttl: widget.period,
        );
  }

  Optional<CameraSnapshot> _fetchCachedSnapshot() {
    if (!_camera.isPresent) return const Optional.empty();
    return ref.read(cameraServiceProvider).getCachedSnapshot(
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
            .read(cameraServiceProvider)
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
