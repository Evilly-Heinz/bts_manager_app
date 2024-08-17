class MqttTopic {
  String action;
  String prefix;
  String message;
  String areaCode;
  String centerControlCode;

  MqttTopic({
    required this.action,
    required this.prefix,
    required this.message,
    required this.areaCode,
    required this.centerControlCode,
  });
}
