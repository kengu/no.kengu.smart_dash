extension StringX on String {
  List<String> getVariables() {
    final RegExp regex = RegExp(r'\$\{(\w+)\}');
    final Iterable<RegExpMatch> matches = regex.allMatches(this);

    // Use a Set to ensure uniqueness
    final Set<String> variables = {};

    for (final RegExpMatch match in matches) {
      // Group 1 contains the variable name
      variables.add(match.group(1)!);
    }
    return variables.toList();
  }

  String setVariables(Map<String, String> values) {
    final RegExp regex = RegExp(r'\$\{(\w+)\}');

    return replaceAllMapped(regex, (match) {
      // Group 1 contains the variable name
      final String name = match.group(1)!;
      // Return the replacement value if it exists, otherwise keep the original
      return values[name] ?? match.group(0)!;
    });
  }
}
