class MqttMessage {
  MqttMessage({required this.topic, required this.payload});
  final String topic;
  final String payload;
}
