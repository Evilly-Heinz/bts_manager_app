// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'center_control_alert.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CenterControlAlert _$CenterControlAlertFromJson(Map<String, dynamic> json) =>
    CenterControlAlert(
      fireDetected: json['FIRE'] as bool? ?? false,
      smokeDetected: json['SMOKE'] as bool? ?? false,
      flooded: json['WATER'] as bool? ?? false,
      temperatureOverrange: json['TEMPERATURE'] as bool? ?? false,
      humidityOverrange: json['HUMIDITY'] as bool? ?? false,
      dcCurrentOverrange: json['DC_CURRENT'] as bool? ?? false,
      dcVoltageOverrange: json['DC_VOLTAGE'] as bool? ?? false,
      acCurrentOverrange: json['AC_CURRENT'] as bool? ?? false,
      acVoltageOverrange: json['AC_VOLTAGE'] as bool? ?? false,
      fuelLow: json['FUEL'] as bool? ?? false,
      motionDetected: json['HUMAN'] as bool? ?? false,
      upsUsing: json['UPS'] as bool? ?? false,
      generator: json['GENERATOR'] as bool? ?? false,
      controllerDisconnect: json['DISCONNECT'] as bool? ?? false,
      lostPhase: json['PHASE'] as bool? ?? false,
      heartBeat: json['HEART_BEAT'] as bool? ?? false,
      door1OpenDetected: json['DOOR1'] as bool? ?? false,
      door2OpenDetected: json['DOOR2'] as bool? ?? false,
      airConditioner1Broken: json['AIRCONDITIONER_BROKEN_1'] as bool? ?? false,
      airConditioner2Broken: json['AIRCONDITIONER_BROKEN_2'] as bool? ?? false,
      generatorBroken: json['GENERATOR_BROKEN'] as bool? ?? false,
    );

Map<String, bool> _$CenterControlAlertToJson(CenterControlAlert instance) =>
    <String, bool>{
      'FIRE': instance.fireDetected,
      'SMOKE': instance.smokeDetected,
      'WATER': instance.flooded,
      'TEMPERATURE': instance.temperatureOverrange,
      'HUMIDITY': instance.humidityOverrange,
      'DC_CURRENT': instance.dcCurrentOverrange,
      'DC_VOLTAGE': instance.dcVoltageOverrange,
      'AC_CURRENT': instance.acCurrentOverrange,
      'AC_VOLTAGE': instance.acVoltageOverrange,
      'FUEL': instance.fuelLow,
      'HUMAN': instance.motionDetected,
      'UPS': instance.upsUsing,
      'GENERATOR': instance.generator,
      'DISCONNECT': instance.controllerDisconnect,
      'PHASE': instance.lostPhase,
      'HEART_BEAT': instance.heartBeat,
      'DOOR1': instance.door1OpenDetected,
      'DOOR2': instance.door2OpenDetected,
      'AIRCONDITIONER_BROKEN_1': instance.airConditioner1Broken,
      'AIRCONDITIONER_BROKEN_2': instance.airConditioner2Broken,
      'GENERATOR_BROKEN': instance.generatorBroken
    };
