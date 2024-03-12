import 'package:optional/optional.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_dash/core/presentation/widget/load/async_load_controller.dart';
import 'package:smart_dash/feature/notification/application/notification_service.dart';
import 'package:smart_dash/feature/notification/domain/notification.dart';

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
      }).cancel,
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
