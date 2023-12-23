import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'fullscreen_state.g.dart';

@riverpod
class FullscreenState extends _$FullscreenState {
  @override
  bool build() => false;

  bool toggle() => state = !state;

  static FullscreenState notifier(WidgetRef ref) =>
      ref.read(fullscreenStateProvider.notifier);

  static bool read(WidgetRef ref) => ref.read(fullscreenStateProvider);

  static bool watch(WidgetRef ref) => ref.watch(fullscreenStateProvider);
}
