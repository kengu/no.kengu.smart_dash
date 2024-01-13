class Pages {
  static const home = '/home';
  static const history = '/history';
  static const cameras = '/cameras';
  static const notifications = '/notifications';

  static const List<String> locations = [
    Pages.home,
    Pages.history,
    Pages.cameras,
    Pages.notifications,
  ];

  static int indexOf(String location) => locations.indexOf(location);
  static bool contains(String location) => locations.contains(location);
}
