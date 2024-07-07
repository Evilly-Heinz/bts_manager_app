// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'configuration.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Configuration _$ConfigurationFromJson(Map<String, dynamic> json) =>
    Configuration(
      id: json['id'] as String,
      temperatureThresholdMin:
          (json['temperatureThresholdMin'] as num?)?.toDouble(),
      temperatureThresholdMax:
          (json['temperatureThresholdMax'] as num?)?.toDouble(),
      humidityThresholdMin: (json['humidityThresholdMin'] as num?)?.toDouble(),
      humidityThresholdMax: (json['humidityThresholdMax'] as num?)?.toDouble(),
      acVoltageThresholdMin:
          (json['acVoltageThresholdMin'] as num?)?.toDouble(),
      acVoltageThresholdMax:
          (json['acVoltageThresholdMax'] as num?)?.toDouble(),
      acFrequencyThresholdMin:
          (json['acFrequencyThresholdMin'] as num?)?.toDouble(),
      acFrequencyThresholdMax:
          (json['acFrequencyThresholdMax'] as num?)?.toDouble(),
      acCurrentThresholdMin:
          (json['acCurrentThresholdMin'] as num?)?.toDouble(),
      acCurrentThresholdMax:
          (json['acCurrentThresholdMax'] as num?)?.toDouble(),
      dcCurrentThresholdMin:
          (json['dcCurrentThresholdMin'] as num?)?.toDouble(),
      dcCurrentThresholdMax:
          (json['dcCurrentThresholdMax'] as num?)?.toDouble(),
      dcVoltageThresholdMin:
          (json['dcVoltageThresholdMin'] as num?)?.toDouble(),
      dcVoltageThresholdMax:
          (json['dcVoltageThresholdMax'] as num?)?.toDouble(),
      fuelLevelThreshold: (json['fuelLevelThreshold'] as num?)?.toDouble(),
      timeAllowToAccessInMinutes:
          (json['timeAllowToAccessInMinutes'] as num?)?.toInt(),
      operationMinuteRotate: (json['operationMinuteRotate'] as num?)?.toInt(),
      temperatureRotateThresholdMin:
          (json['temperatureRotateThresholdMin'] as num?)?.toDouble(),
      temperatureRotateThresholdMax:
          (json['temperatureRotateThresholdMax'] as num?)?.toDouble(),
      delayTimeSwitchPowerSource:
          (json['delayTimeSwitchPowerSource'] as num?)?.toInt(),
      cameraLink: json['cameraLink'] as String?,
    );

Map<String, dynamic> _$ConfigurationToJson(Configuration instance) =>
    <String, dynamic>{
      'id': instance.id,
      'temperatureThresholdMin': instance.temperatureThresholdMin,
      'temperatureThresholdMax': instance.temperatureThresholdMax,
      'humidityThresholdMin': instance.humidityThresholdMin,
      'humidityThresholdMax': instance.humidityThresholdMax,
      'acVoltageThresholdMin': instance.acVoltageThresholdMin,
      'acVoltageThresholdMax': instance.acVoltageThresholdMax,
      'acFrequencyThresholdMin': instance.acFrequencyThresholdMin,
      'acFrequencyThresholdMax': instance.acFrequencyThresholdMax,
      'acCurrentThresholdMin': instance.acCurrentThresholdMin,
      'acCurrentThresholdMax': instance.acCurrentThresholdMax,
      'dcCurrentThresholdMin': instance.dcCurrentThresholdMin,
      'dcCurrentThresholdMax': instance.dcCurrentThresholdMax,
      'dcVoltageThresholdMin': instance.dcVoltageThresholdMin,
      'dcVoltageThresholdMax': instance.dcVoltageThresholdMax,
      'fuelLevelThreshold': instance.fuelLevelThreshold,
      'timeAllowToAccessInMinutes': instance.timeAllowToAccessInMinutes,
      'operationMinuteRotate': instance.operationMinuteRotate,
      'temperatureRotateThresholdMin': instance.temperatureRotateThresholdMin,
      'temperatureRotateThresholdMax': instance.temperatureRotateThresholdMax,
      'delayTimeSwitchPowerSource': instance.delayTimeSwitchPowerSource,
      'cameraLink': instance.cameraLink,
    };
