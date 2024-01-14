import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:optional/optional.dart';

class CameraGroupControls extends StatefulWidget {
  const CameraGroupControls({
    super.key,
    required this.refreshRate,
    required this.motionDetectEnabled,
    required this.onChangedRefreshRate,
    required this.onChangedMotionDetect,
    this.periods = const [1, 2, 5, 10, 15, 30, 60],
  });

  final int refreshRate;
  final List<int> periods;

  final Optional<bool> motionDetectEnabled;

  final ValueChanged<int> onChangedRefreshRate;

  final FutureOr<Optional<bool>> Function(bool value) onChangedMotionDetect;

  @override
  State<CameraGroupControls> createState() => _CameraGroupControlsState();
}

class _CameraGroupControlsState extends State<CameraGroupControls> {
  int? _refreshRate = 5;

  bool _updatingMotionConfig = false;

  Optional<bool> _motionDetectEnabled = const Optional.empty();

  @override
  void initState() {
    _refreshRate = widget.refreshRate;
    _motionDetectEnabled = widget.motionDetectEnabled;
    super.initState();
  }

  @override
  void didUpdateWidget(covariant CameraGroupControls oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.refreshRate != oldWidget.refreshRate ||
        widget.motionDetectEnabled != oldWidget.motionDetectEnabled) {
      setState(() {
        _refreshRate = widget.refreshRate;
        _motionDetectEnabled = widget.motionDetectEnabled;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          ListTile(
            title: const Text('Motion detection'),
            trailing: Transform.scale(
              scale: 0.8,
              child: Tooltip(
                message: _motionDetectEnabled.isPresent
                    ? _motionDetectEnabled.value
                        ? 'Turn OFF motion detection for cameras'
                        : 'Turn ON motion detection for cameras'
                    : 'Unavailable',
                child: CupertinoSwitch(
                  activeColor: Colors.blueAccent,
                  value: _motionDetectEnabled.orElseNull ?? false,
                  onChanged:
                      _motionDetectEnabled.isPresent && !_updatingMotionConfig
                          ? _onChangedMotionDetect
                          : null,
                ),
              ),
            ),
          ),
          ListTile(
            title: const Text('Camera refresh rate'),
            trailing: Tooltip(
              message: 'Change refresh rate for all cameras',
              child: DropdownButton<int>(
                value: _refreshRate,
                focusColor: Colors.transparent,
                onChanged: _onChangedRefreshRate,
                items: [
                  ...widget.periods.map(
                    (e) => DropdownMenuItem(
                      value: e,
                      child: Text('${e}s'),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _onChangedRefreshRate(int? value) {
    setState(() {
      _refreshRate = value;
    });
    if (value != null) {
      widget.onChangedRefreshRate(value);
    }
  }

  Future<void> _onChangedMotionDetect(bool enabled) async {
    setState(() {
      _updatingMotionConfig = true;
    });
    _motionDetectEnabled = await widget.onChangedMotionDetect(
      enabled,
    );
    setState(() {
      _updatingMotionConfig = false;
    });
  }
}
