class DeviceDefinition {
  const DeviceDefinition({
    required this.type,
    required this.name,
  });

  final String type;
  final String name;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DeviceDefinition &&
          runtimeType == other.runtimeType &&
          type == other.type &&
          name == other.name;

  @override
  int get hashCode => type.hashCode ^ name.hashCode;
}
