import 'dart:async';

import 'package:optional/optional.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_dash_account/smart_dash_account_app.dart';
import 'package:smart_dash_app/core/presentation/widget/state/smart_dash_state.dart';
import 'package:smart_dash_app/feature/setting/application/setting_service.dart';
import 'package:smart_dash_app/feature/setting/data/setting_repository.dart';
import 'package:stream_transform/stream_transform.dart';

part 'home_controller.g.dart';

class HomeQuery {
  const HomeQuery();
}

class HomeData {
  HomeData({required this.home, required this.settings});

  final Home home;
  final SettingMap settings;

  HomeData copyWith(Home home) {
    return HomeData(home: home, settings: settings);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HomeData &&
          runtimeType == other.runtimeType &&
          home == other.home &&
          settings == other.settings;

  @override
  int get hashCode => home.hashCode ^ settings.hashCode;
}

@riverpod
class HomeController extends _$HomeController
    with AsyncViewModel<HomeQuery, HomeData> {
  final List<StreamSubscription> _subscriptions = [];

  @override
  FutureOr<Optional<HomeData>> build(HomeQuery query) {
    ref.onDispose(() {
      for (final it in _subscriptions) {
        it.cancel();
      }
    });
    final accountService = ref.read(accountServiceProvider);
    _subscriptions.add(accountService.changes
        .whereType<CurrentHomeModifiedEvent>()
        .listen(_onUpdate));

    return super.build(query);
  }

  void _onUpdate(CurrentHomeModifiedEvent event) {
    if (state.hasValue &&
        state.value!.isPresent &&
        state.value!.value.home != event.home) {
      state = AsyncValue.data(
        Optional.of(
          state.value!.value.copyWith(
            event.home,
          ),
        ),
      );
    }
  }

  @override
  Future<Optional<HomeData>> load(HomeQuery query) async {
    final settings = ref.read(settingServiceProvider).settings;
    final accountService = ref.read(accountServiceProvider);
    final home = await accountService.getCurrentHome();
    if (!home.isPresent) {
      return Optional.empty();
    }
    return Optional.of(HomeData(
      home: home.value,
      settings: settings,
    ));
  }
}
