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

  void copyWith(Map<String, dynamic> json) {
    updateTime = json['updateTime'] ?? updateTime;
    indoorTemperature = json['indoorTemperature'] ?? indoorTemperature;
    outdoorTemperature = json['outdoorTemperature'] ?? outdoorTemperature;
    closetTemperature1 = json['closetTemperature1'] ?? closetTemperature1;
    closetTemperature2 = json['closetTemperature2'] ?? closetTemperature2;
    closetTemperature3 = json['closetTemperature3'] ?? closetTemperature3;
    closetTemperature4 = json['closetTemperature4'] ?? closetTemperature4;
    closetTemperature5 = json['closetTemperature5'] ?? closetTemperature5;
    closetTemperature6 = json['closetTemperature6'] ?? closetTemperature6;
    closetTemperature7 = json['closetTemperature7'] ?? closetTemperature7;
    closetTemperature8 = json['closetTemperature8'] ?? closetTemperature8;
    closetTemperature9 = json['closetTemperature9'] ?? closetTemperature9;
    humidity = json['humidity'] ?? humidity;
    acCurrentPhase1 = json['acCurrentPhase1'] ?? acCurrentPhase1;
    acCurrentPhase2 = json['acCurrentPhase2'] ?? acCurrentPhase2;
    acCurrentPhase3 = json['acCurrentPhase3'] ?? acCurrentPhase3;
    acCurrentNaturePhase1 =
        json['acCurrentNaturePhase1'] ?? acCurrentNaturePhase1;
    acCurrentNaturePhase2 =
        json['acCurrentNaturePhase2'] ?? acCurrentNaturePhase2;
    acVoltagePhase1 = json['acVoltagePhase1'] ?? acVoltagePhase1;
    acVoltagePhase2 = json['acVoltagePhase2'] ?? acVoltagePhase2;
    acVoltagePhase3 = json['acVoltagePhase3'] ?? acVoltagePhase3;
    acFrequencyPhase1 = json['acFrequencyPhase1'] ?? acFrequencyPhase1;
    acFrequencyPhase2 = json['acFrequencyPhase2'] ?? acFrequencyPhase2;
    acFrequencyPhase3 = json['acFrequencyPhase3'] ?? acFrequencyPhase3;
    acPowerSupply = json['acPowerSupply'] == null
        ? $enumDecodeNullable(_$ACPowerSupplyEnumMap, json['acPowerSupply'])
        : acPowerSupply;
    dcCurrent1 = json['dcCurrent1'] ?? dcCurrent1;
    dcCurrent2 = json['dcCurrent2'] ?? dcCurrent2;
    dcCurrent3 = json['dcCurrent3'] ?? dcCurrent3;
    dcCurrent4 = json['dcCurrent4'] ?? dcCurrent4;
    dcCurrent5 = json['dcCurrent5'] ?? dcCurrent5;
    dcCurrent6 = json['dcCurrent6'] ?? dcCurrent6;
    dcCurrent7 = json['dcCurrent7'] ?? dcCurrent7;
    dcCurrent8 = json['dcCurrent8'] ?? dcCurrent8;
    dcVoltage1 = json['dcVoltage1'] ?? dcVoltage1;
    dcVoltage2 = json['dcVoltage2'] ?? dcVoltage2;
    dcVoltage3 = json['dcVoltage3'] ?? dcVoltage3;
    dcVoltage4 = json['dcVoltage4'] ?? dcVoltage4;
    fuelLevel = json['fuelLevel'] ?? fuelLevel;
    fireAlarmStatus = json['fireAlarmStatus'] ?? fireAlarmStatus;
    heatPumpStatus = json['heatPumpStatus'] ?? heatPumpStatus;
    airConditionStatus = json['airConditionStatus'] ?? airConditionStatus;
    airConditionTemperature =
        json['airConditionTemperature'] ?? airConditionTemperature;
    airConditionStatus2 = json['airConditionStatus2'] ?? airConditionStatus2;
    airConditionTemperature2 =
        json['airConditionTemperature2'] ?? airConditionTemperature2;
  }

  factory CenterControlStatus.fromJson(Map<String, dynamic> json) =>
      _$CenterControlStatusFromJson(json);
  factory CenterControlStatus.fromMqttMessage(
      String code, Map<String, dynamic> json) {
    return CenterControlStatus(
      id: 'MQTTMESSAGE',
      centerControlId: code,
      updateTime: json['updateTime'] == null
          ? null
          : DateTime.parse(json['updateTime'] as String),
      indoorTemperature:
          (json['TEMPERATURE']?['TEMPERATURE_1'] as num?)?.toDouble(),
      outdoorTemperature:
          (json['TEMPERATURE']?['TEMPERATURE_2'] as num?)?.toDouble(),
      closetTemperature1:
          (json['TEMPERATURE']?['TEMPERATURE_3'] as num?)?.toDouble(),
      closetTemperature2:
          (json['TEMPERATURE']?['TEMPERATURE_4'] as num?)?.toDouble(),
      closetTemperature3:
          (json['TEMPERATURE']?['TEMPERATURE_5'] as num?)?.toDouble(),
      closetTemperature4:
          (json['TEMPERATURE']?['TEMPERATURE_6'] as num?)?.toDouble(),
      closetTemperature5:
          (json['TEMPERATURE']?['TEMPERATURE_7'] as num?)?.toDouble(),
      closetTemperature6:
          (json['TEMPERATURE']?['TEMPERATURE_8'] as num?)?.toDouble(),
      closetTemperature7:
          (json['TEMPERATURE']?['TEMPERATURE_9'] as num?)?.toDouble(),
      closetTemperature8:
          (json['TEMPERATURE']?['TEMPERATURE_10'] as num?)?.toDouble(),
      closetTemperature9:
          (json['TEMPERATURE']?['TEMPERATURE_11'] as num?)?.toDouble(),
      humidity: (json['HUMIDITY'] as num?)?.toDouble(),
      acCurrentPhase1: (json['AC_CURRENT']['AC_CURRENT_1'] as num?)?.toDouble(),
      acCurrentPhase2: (json['AC_CURRENT']['AC_CURRENT_2'] as num?)?.toDouble(),
      acCurrentPhase3: (json['AC_CURRENT']['AC_CURRENT_3'] as num?)?.toDouble(),
      acCurrentNaturePhase1:
          (json['AC_CURRENT']['AC_CURRENT_4'] as num?)?.toDouble(),
      acCurrentNaturePhase2:
          (json['AC_CURRENT']['AC_CURRENT_5'] as num?)?.toDouble(),
      acVoltagePhase1: (json['AC_VOL']['AC_VOL_1'] as num?)?.toDouble(),
      acVoltagePhase2: (json['AC_VOL']['AC_VOL_2'] as num?)?.toDouble(),
      acVoltagePhase3: (json['AC_VOL']['AC_VOL_3'] as num?)?.toDouble(),
      acPowerSupply: $enumDecodeNullable(_$ACPowerSupplyEnumMap, json['ATS']),
      dcCurrent1: (json['DC_CURRENT']?['DC_CURRENT_1'] as num?)?.toDouble(),
      dcCurrent2: (json['DC_CURRENT']?['DC_CURRENT_2'] as num?)?.toDouble(),
      dcCurrent3: (json['DC_CURRENT']?['DC_CURRENT_3'] as num?)?.toDouble(),
      dcCurrent4: (json['DC_CURRENT']?['DC_CURRENT_4'] as num?)?.toDouble(),
      dcCurrent5: (json['DC_CURRENT']?['DC_CURRENT_5'] as num?)?.toDouble(),
      dcCurrent6: (json['DC_CURRENT']?['DC_CURRENT_6'] as num?)?.toDouble(),
      dcCurrent7: (json['DC_CURRENT']?['DC_CURRENT_7'] as num?)?.toDouble(),
      dcCurrent8: (json['DC_CURRENT']?['DC_CURRENT_8'] as num?)?.toDouble(),
      dcVoltage1: (json['DC_VOL']?['DC_VOL_1'] as num?)?.toDouble(),
      dcVoltage2: (json['DC_VOL']?['DC_VOL_2'] as num?)?.toDouble(),
      dcVoltage3: (json['DC_VOL']?['DC_VOL_3'] as num?)?.toDouble(),
      dcVoltage4: (json['DC_VOL']?['DC_VOL_4'] as num?)?.toDouble(),
      fuelLevel: (json['FUEL'] as num?)?.toDouble(),
      fireAlarmStatus: json['FIRE_ALARM'] as bool? ?? false,
      heatPumpStatus: json['FAN'] as bool? ?? false,
      airConditionStatus: json['AIR_CONDITION_STATUS'] as bool? ?? false,
      airConditionTemperature: (json['AIR_CONDITION_TEMP'] as num?)?.toDouble(),
      airConditionStatus2: json['AIR_CONDITION_STATUS_2'] as bool? ?? false,
      airConditionTemperature2:
          (json['AIR_CONDITION_TEMP_2'] as num?)?.toDouble(),
    );
  }
  Map<String, dynamic> toJson() => _$CenterControlStatusToJson(this);
}
