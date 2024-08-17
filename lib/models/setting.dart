import 'package:json_annotation/json_annotation.dart';
part 'setting.g.dart';

@JsonSerializable()
class Setting {
  String id;
  String googleMapApiKey;
  String mqttHostName;
  String mqttUsername;
  String mqttPassword;
  int mqttPort;
  String mqttAppName;
  String mqttTopicStatus;
  String mqttTopicControl;
  String mqttTopicConfig;
  String mqttTopicAlert;
  String mqttPath;
  String mqttProtocol;

  Setting({
    required this.id,
    required this.googleMapApiKey,
    required this.mqttHostName,
    required this.mqttUsername,
    required this.mqttPassword,
    required this.mqttPort,
    required this.mqttAppName,
    required this.mqttTopicStatus,
    required this.mqttTopicControl,
    required this.mqttTopicConfig,
    required this.mqttTopicAlert,
    required this.mqttPath,
    required this.mqttProtocol,
  });

  factory Setting.fromJson(Map<String, dynamic> json) =>
      _$SettingFromJson(json);
  Map<String, dynamic> toJson() => _$SettingToJson(this);
}
