// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'setting.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Setting _$SettingFromJson(Map<String, dynamic> json) => Setting(
      id: json['id'] as String,
      googleMapApiKey: json['googleMapApiKey'] as String,
      mqttHostName: json['mqttHostName'] as String,
      mqttUsername: json['mqttUsername'] as String,
      mqttPassword: json['mqttPassword'] as String,
      mqttPort: (json['mqttPort'] as num).toInt(),
      mqttAppName: json['mqttAppName'] as String,
      mqttTopicStatus: json['mqttTopicStatus'] as String,
      mqttTopicControl: json['mqttTopicControl'] as String,
      mqttTopicConfig: json['mqttTopicConfig'] as String,
      mqttTopicAlert: json['mqttTopicAlert'] as String,
      mqttPath: json['mqttPath'] as String,
      mqttProtocol: json['mqttProtocol'] as String,
    );

Map<String, dynamic> _$SettingToJson(Setting instance) => <String, dynamic>{
      'id': instance.id,
      'googleMapApiKey': instance.googleMapApiKey,
      'mqttHostName': instance.mqttHostName,
      'mqttUsername': instance.mqttUsername,
      'mqttPassword': instance.mqttPassword,
      'mqttPort': instance.mqttPort,
      'mqttAppName': instance.mqttAppName,
      'mqttTopicStatus': instance.mqttTopicStatus,
      'mqttTopicControl': instance.mqttTopicControl,
      'mqttTopicConfig': instance.mqttTopicConfig,
      'mqttTopicAlert': instance.mqttTopicAlert,
      'mqttPath': instance.mqttPath,
      'mqttProtocol': instance.mqttProtocol,
    };
