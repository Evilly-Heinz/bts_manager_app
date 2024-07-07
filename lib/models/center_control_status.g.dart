// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'center_control_status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CenterControlStatus _$CenterControlStatusFromJson(Map<String, dynamic> json) =>
    CenterControlStatus(
      id: json['id'] as String,
      centerControlId: json['centerControlId'] as String,
      updateTime: json['updateTime'] == null
          ? null
          : DateTime.parse(json['updateTime'] as String),
      indoorTemperature: (json['indoorTemperature'] as num?)?.toDouble(),
      outdoorTemperature: (json['outdoorTemperature'] as num?)?.toDouble(),
      closetTemperature1: (json['closetTemperature1'] as num?)?.toDouble(),
      closetTemperature2: (json['closetTemperature2'] as num?)?.toDouble(),
      closetTemperature3: (json['closetTemperature3'] as num?)?.toDouble(),
      closetTemperature4: (json['closetTemperature4'] as num?)?.toDouble(),
      closetTemperature5: (json['closetTemperature5'] as num?)?.toDouble(),
      closetTemperature6: (json['closetTemperature6'] as num?)?.toDouble(),
      closetTemperature7: (json['closetTemperature7'] as num?)?.toDouble(),
      closetTemperature8: (json['closetTemperature8'] as num?)?.toDouble(),
      closetTemperature9: (json['closetTemperature9'] as num?)?.toDouble(),
      humidity: (json['humidity'] as num?)?.toDouble(),
      acCurrentPhase1: (json['acCurrentPhase1'] as num?)?.toDouble(),
      acCurrentPhase2: (json['acCurrentPhase2'] as num?)?.toDouble(),
      acCurrentPhase3: (json['acCurrentPhase3'] as num?)?.toDouble(),
      acCurrentNaturePhase1:
          (json['acCurrentNaturePhase1'] as num?)?.toDouble(),
      acCurrentNaturePhase2:
          (json['acCurrentNaturePhase2'] as num?)?.toDouble(),
      acVoltagePhase1: (json['acVoltagePhase1'] as num?)?.toDouble(),
      acVoltagePhase2: (json['acVoltagePhase2'] as num?)?.toDouble(),
      acVoltagePhase3: (json['acVoltagePhase3'] as num?)?.toDouble(),
      acFrequencyPhase1: (json['acFrequencyPhase1'] as num?)?.toDouble(),
      acFrequencyPhase2: (json['acFrequencyPhase2'] as num?)?.toDouble(),
      acFrequencyPhase3: (json['acFrequencyPhase3'] as num?)?.toDouble(),
      acPowerSupply:
          $enumDecodeNullable(_$ACPowerSupplyEnumMap, json['acPowerSupply']),
      dcCurrent1: (json['dcCurrent1'] as num?)?.toDouble(),
      dcCurrent2: (json['dcCurrent2'] as num?)?.toDouble(),
      dcCurrent3: (json['dcCurrent3'] as num?)?.toDouble(),
      dcCurrent4: (json['dcCurrent4'] as num?)?.toDouble(),
      dcCurrent5: (json['dcCurrent5'] as num?)?.toDouble(),
      dcCurrent6: (json['dcCurrent6'] as num?)?.toDouble(),
      dcCurrent7: (json['dcCurrent7'] as num?)?.toDouble(),
      dcCurrent8: (json['dcCurrent8'] as num?)?.toDouble(),
      dcVoltage1: (json['dcVoltage1'] as num?)?.toDouble(),
      dcVoltage2: (json['dcVoltage2'] as num?)?.toDouble(),
      dcVoltage3: (json['dcVoltage3'] as num?)?.toDouble(),
      dcVoltage4: (json['dcVoltage4'] as num?)?.toDouble(),
      fuelLevel: (json['fuelLevel'] as num?)?.toDouble(),
      fireAlarmStatus: json['fireAlarmStatus'] as bool? ?? false,
      heatPumpStatus: json['heatPumpStatus'] as bool? ?? false,
      airConditionStatus: json['airConditionStatus'] as bool? ?? false,
      airConditionTemperature:
          (json['airConditionTemperature'] as num?)?.toDouble(),
      airConditionStatus2: json['airConditionStatus2'] as bool? ?? false,
      airConditionTemperature2:
          (json['airConditionTemperature2'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$CenterControlStatusToJson(
        CenterControlStatus instance) =>
    <String, dynamic>{
      'id': instance.id,
      'centerControlId': instance.centerControlId,
      'updateTime': instance.updateTime?.toIso8601String(),
      'indoorTemperature': instance.indoorTemperature,
      'outdoorTemperature': instance.outdoorTemperature,
      'closetTemperature1': instance.closetTemperature1,
      'closetTemperature2': instance.closetTemperature2,
      'closetTemperature3': instance.closetTemperature3,
      'closetTemperature4': instance.closetTemperature4,
      'closetTemperature5': instance.closetTemperature5,
      'closetTemperature6': instance.closetTemperature6,
      'closetTemperature7': instance.closetTemperature7,
      'closetTemperature8': instance.closetTemperature8,
      'closetTemperature9': instance.closetTemperature9,
      'humidity': instance.humidity,
      'acCurrentPhase1': instance.acCurrentPhase1,
      'acCurrentPhase2': instance.acCurrentPhase2,
      'acCurrentPhase3': instance.acCurrentPhase3,
      'acCurrentNaturePhase1': instance.acCurrentNaturePhase1,
      'acCurrentNaturePhase2': instance.acCurrentNaturePhase2,
      'acVoltagePhase1': instance.acVoltagePhase1,
      'acVoltagePhase2': instance.acVoltagePhase2,
      'acVoltagePhase3': instance.acVoltagePhase3,
      'acFrequencyPhase1': instance.acFrequencyPhase1,
      'acFrequencyPhase2': instance.acFrequencyPhase2,
      'acFrequencyPhase3': instance.acFrequencyPhase3,
      'acPowerSupply': _$ACPowerSupplyEnumMap[instance.acPowerSupply],
      'dcCurrent1': instance.dcCurrent1,
      'dcCurrent2': instance.dcCurrent2,
      'dcCurrent3': instance.dcCurrent3,
      'dcCurrent4': instance.dcCurrent4,
      'dcCurrent5': instance.dcCurrent5,
      'dcCurrent6': instance.dcCurrent6,
      'dcCurrent7': instance.dcCurrent7,
      'dcCurrent8': instance.dcCurrent8,
      'dcVoltage1': instance.dcVoltage1,
      'dcVoltage2': instance.dcVoltage2,
      'dcVoltage3': instance.dcVoltage3,
      'dcVoltage4': instance.dcVoltage4,
      'fuelLevel': instance.fuelLevel,
      'fireAlarmStatus': instance.fireAlarmStatus,
      'heatPumpStatus': instance.heatPumpStatus,
      'airConditionStatus': instance.airConditionStatus,
      'airConditionTemperature': instance.airConditionTemperature,
      'airConditionStatus2': instance.airConditionStatus2,
      'airConditionTemperature2': instance.airConditionTemperature2,
    };

const _$ACPowerSupplyEnumMap = {
  ACPowerSupply.grid: 0,
  ACPowerSupply.generator: 1,
  ACPowerSupply.ups: 2,
};
