import 'package:optional/optional.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_dash_app/core/presentation/widget/load/async_load_controller.dart';
import 'package:smart_dash_notification/smart_dash_notification.dart';

part 'notification_screen_controller.g.dart';

class NotificationQuery {}

@riverpod
class NotificationScreenController extends _$NotificationScreenController
    with AsyncLoadController<NotificationQuery, List<NotificationModel>> {
  @override
  FutureOr<Optional<List<NotificationModel>>> build(NotificationQuery query) {
    final service = ref.read(notificationServiceProvider);
    ref.onDispose(
      service.active.listen((e) async {
        final active = await service.getActive();
        state = AsyncData(Optional.of(active));
      }, cancelOnError: false).cancel,
    );

    return super.build(query);
  }

  @override
  Future<Optional<List<NotificationModel>>> load(
      NotificationQuery query) async {
    final active = await ref.read(notificationServiceProvider).getActive();
    return Optional.of(active);
  }
}
