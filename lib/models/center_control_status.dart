import 'package:json_annotation/json_annotation.dart';

import 'ac_power_supply.dart';
part 'center_control_status.g.dart';

@JsonSerializable()
class CenterControlStatus {
  final String id;
  final String centerControlId;
  DateTime? updateTime;
  double? indoorTemperature;
  double? outdoorTemperature;
  double? closetTemperature1;
  double? closetTemperature2;
  double? closetTemperature3;
  double? closetTemperature4;
  double? closetTemperature5;
  double? closetTemperature6;
  double? closetTemperature7;
  double? closetTemperature8;
  double? closetTemperature9;
  double? humidity;
  double? acCurrentPhase1;
  double? acCurrentPhase2;
  double? acCurrentPhase3;
  double? acCurrentNaturePhase1;
  double? acCurrentNaturePhase2;
  double? acVoltagePhase1;
  double? acVoltagePhase2;
  double? acVoltagePhase3;
  double? acFrequencyPhase1;
  double? acFrequencyPhase2;
  double? acFrequencyPhase3;
  ACPowerSupply? acPowerSupply;
  double? dcCurrent1;
  double? dcCurrent2;
  double? dcCurrent3;
  double? dcCurrent4;
  double? dcCurrent5;
  double? dcCurrent6;
  double? dcCurrent7;
  double? dcCurrent8;
  double? dcVoltage1;
  double? dcVoltage2;
  double? dcVoltage3;
  double? dcVoltage4;
  double? fuelLevel;
  bool fireAlarmStatus;
  bool heatPumpStatus;
  bool airConditionStatus;
  double? airConditionTemperature;
  bool airConditionStatus2;
  double? airConditionTemperature2;
  // Add the rest of the fields following the same pattern

  CenterControlStatus({
    required this.id,
    required this.centerControlId,
    this.updateTime,
    this.indoorTemperature,
    this.outdoorTemperature,
    this.closetTemperature1,
    this.closetTemperature2,
    this.closetTemperature3,
    this.closetTemperature4,
    this.closetTemperature5,
    this.closetTemperature6,
    this.closetTemperature7,
    this.closetTemperature8,
    this.closetTemperature9,
    this.humidity,
    this.acCurrentPhase1,
    this.acCurrentPhase2,
    this.acCurrentPhase3,
    this.acCurrentNaturePhase1,
    this.acCurrentNaturePhase2,
    this.acVoltagePhase1,
    this.acVoltagePhase2,
    this.acVoltagePhase3,
    this.acFrequencyPhase1,
    this.acFrequencyPhase2,
    this.acFrequencyPhase3,
    this.acPowerSupply,
    this.dcCurrent1,
    this.dcCurrent2,
    this.dcCurrent3,
    this.dcCurrent4,
    this.dcCurrent5,
    this.dcCurrent6,
    this.dcCurrent7,
    this.dcCurrent8,
    this.dcVoltage1,
    this.dcVoltage2,
    this.dcVoltage3,
    this.dcVoltage4,
    this.fuelLevel,
    this.fireAlarmStatus = false,
    this.heatPumpStatus = false,
    this.airConditionStatus = false,
    this.airConditionTemperature,
    this.airConditionStatus2 = false,
    this.airConditionTemperature2,
  });

  factory CenterControlStatus.fromJson(Map<String, dynamic> json) =>
      _$CenterControlStatusFromJson(json);
  Map<String, dynamic> toJson() => _$CenterControlStatusToJson(this);
}
