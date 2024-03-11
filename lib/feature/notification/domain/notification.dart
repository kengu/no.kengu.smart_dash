/// Details of an active notification.
class ActiveNotificationDetails {
  const ActiveNotificationDetails({
    required this.id,
    required this.title,
    required this.body,
  });

  /// The notification's id.
  final int id;

  /// The notification's title.
  final String title;

  /// The notification's body.
  final String body;
}
