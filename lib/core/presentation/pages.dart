class Pages {
  static const home = '/home';
  static const rooms = '/rooms';
  static const cameras = '/cameras';
  static const flows = '/flows';
  static const history = '/history';

  static const List<String> locations = [
    Pages.home,
    Pages.rooms,
    Pages.cameras,
    Pages.flows,
    Pages.history,
  ];

  static int indexOf(String location) => locations.indexOf(location);
  static bool contains(String location) => locations.contains(location);
}
