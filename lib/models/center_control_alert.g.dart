// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'center_control_alert.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CenterControlAlert _$CenterControlAlertFromJson(Map<String, dynamic> json) =>
    CenterControlAlert(
      fireDetected: json['fireDetected'] as bool? ?? false,
      smokeDetected: json['smokeDetected'] as bool? ?? false,
      flooded: json['flooded'] as bool? ?? false,
      temperatureOverrange: json['temperatureOverrange'] as bool? ?? false,
      humidityOverrange: json['humidityOverrange'] as bool? ?? false,
      dcCurrentOverrange: json['dcCurrentOverrange'] as bool? ?? false,
      dcVoltageOverrange: json['dcVoltageOverrange'] as bool? ?? false,
      acCurrentOverrange: json['acCurrentOverrange'] as bool? ?? false,
      acVoltageOverrange: json['acVoltageOverrange'] as bool? ?? false,
      fuelLow: json['fuelLow'] as bool? ?? false,
      motionDetected: json['motionDetected'] as bool? ?? false,
      upsUsing: json['upsUsing'] as bool? ?? false,
      generator: json['generator'] as bool? ?? false,
      controllerDisconnect: json['controllerDisconnect'] as bool? ?? false,
      lostPhase: json['lostPhase'] as bool? ?? false,
      heartBeat: json['heartBeat'] as bool? ?? false,
      door1OpenDetected: json['door1OpenDetected'] as bool? ?? false,
      door2OpenDetected: json['door2OpenDetected'] as bool? ?? false,
    );

Map<String, dynamic> _$CenterControlAlertToJson(CenterControlAlert instance) =>
    <String, dynamic>{
      'fireDetected': instance.fireDetected,
      'smokeDetected': instance.smokeDetected,
      'flooded': instance.flooded,
      'temperatureOverrange': instance.temperatureOverrange,
      'humidityOverrange': instance.humidityOverrange,
      'dcCurrentOverrange': instance.dcCurrentOverrange,
      'dcVoltageOverrange': instance.dcVoltageOverrange,
      'acCurrentOverrange': instance.acCurrentOverrange,
      'acVoltageOverrange': instance.acVoltageOverrange,
      'fuelLow': instance.fuelLow,
      'motionDetected': instance.motionDetected,
      'upsUsing': instance.upsUsing,
      'generator': instance.generator,
      'controllerDisconnect': instance.controllerDisconnect,
      'lostPhase': instance.lostPhase,
      'heartBeat': instance.heartBeat,
      'door1OpenDetected': instance.door1OpenDetected,
      'door2OpenDetected': instance.door2OpenDetected,
    };
