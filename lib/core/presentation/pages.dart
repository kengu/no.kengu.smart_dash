class Pages {
  static const home = '/home';
  static const rooms = '/rooms';
  static const history = '/history';
  static const cameras = '/cameras';
  static const notifications = '/notifications';

  static const List<String> locations = [
    Pages.home,
    Pages.rooms,
    Pages.cameras,
    Pages.history,
    Pages.notifications,
  ];

  static int indexOf(String location) => locations.indexOf(location);
  static bool contains(String location) => locations.contains(location);
}
