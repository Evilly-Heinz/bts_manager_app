import 'package:json_annotation/json_annotation.dart';
part 'configuration.g.dart';

@JsonSerializable()
class Configuration {
  final String id;
  double? temperatureThresholdMin;
  double? temperatureThresholdMax;
  double? humidityThresholdMin;
  double? humidityThresholdMax;
  double? acVoltageThresholdMin;
  double? acVoltageThresholdMax;
  double? acFrequencyThresholdMin;
  double? acFrequencyThresholdMax;
  double? acCurrentThresholdMin;
  double? acCurrentThresholdMax;
  double? dcCurrentThresholdMin;
  double? dcCurrentThresholdMax;
  double? dcVoltageThresholdMin;
  double? dcVoltageThresholdMax;
  double? fuelLevelThreshold;
  int? timeAllowToAccessInMinutes;
  int? operationMinuteRotate;
  double? temperatureRotateThresholdMin;
  double? temperatureRotateThresholdMax;
  int? delayTimeSwitchPowerSource;
  String? cameraLink;
  // Add the rest of the fields following the same pattern

  Configuration({
    required this.id,
    this.temperatureThresholdMin,
    this.temperatureThresholdMax,
    this.humidityThresholdMin,
    this.humidityThresholdMax,
    this.acVoltageThresholdMin,
    this.acVoltageThresholdMax,
    this.acFrequencyThresholdMin,
    this.acFrequencyThresholdMax,
    this.acCurrentThresholdMin,
    this.acCurrentThresholdMax,
    this.dcCurrentThresholdMin,
    this.dcCurrentThresholdMax,
    this.dcVoltageThresholdMin,
    this.dcVoltageThresholdMax,
    this.fuelLevelThreshold,
    this.timeAllowToAccessInMinutes,
    this.operationMinuteRotate,
    this.temperatureRotateThresholdMin,
    this.temperatureRotateThresholdMax,
    this.delayTimeSwitchPowerSource,
    this.cameraLink,
  });

  factory Configuration.fromJson(Map<String, dynamic> json) =>
      _$ConfigurationFromJson(json);
  Map<String, dynamic> toJson() => _$ConfigurationToJson(this);
}
