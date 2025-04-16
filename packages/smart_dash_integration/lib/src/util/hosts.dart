extension HostX on String {
  bool get isLocalhost {
    const localHosts = {
      'localhost',
      '127.0.0.1',
      '0.0.0.0',
      '::1',
    };

    final host = trim().toLowerCase();

    if (localHosts.contains(host)) {
      return true;
    }

    final ipRegExp = RegExp(r'^(\d{1,3})\.(\d{1,3})\.(\d{1,3})\.(\d{1,3})$');
    final match = ipRegExp.firstMatch(host);

    if (match != null) {
      final octets =
          match.groups([1, 2, 3, 4]).nonNulls.map((e) => int.parse(e)).toList();
      if (octets[0] == 10) return true;
      if (octets[0] == 172 && (octets[1] >= 16 && octets[1] <= 31)) return true;
      if (octets[0] == 192 && octets[1] == 168) return true;
    }

    return false;
  }
}
