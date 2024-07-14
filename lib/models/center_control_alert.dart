import 'package:json_annotation/json_annotation.dart';
part 'center_control_alert.g.dart';

@JsonSerializable()
class CenterControlAlert {
  bool fireDetected;
  bool smokeDetected;
  bool flooded;
  bool temperatureOverrange;
  bool humidityOverrange;
  bool dcCurrentOverrange;
  bool dcVoltageOverrange;
  bool acCurrentOverrange;
  bool acVoltageOverrange;
  bool fuelLow;
  bool motionDetected;
  bool upsUsing;
  bool generator;
  bool controllerDisconnect;
  bool lostPhase;
  bool heartBeat;
  bool door1OpenDetected;
  bool door2OpenDetected;

  CenterControlAlert({
    this.fireDetected = false,
    this.smokeDetected = false,
    this.flooded = false,
    this.temperatureOverrange = false,
    this.humidityOverrange = false,
    this.dcCurrentOverrange = false,
    this.dcVoltageOverrange = false,
    this.acCurrentOverrange = false,
    this.acVoltageOverrange = false,
    this.fuelLow = false,
    this.motionDetected = false,
    this.upsUsing = false,
    this.generator = false,
    this.controllerDisconnect = false,
    this.lostPhase = false,
    this.heartBeat = false,
    this.door1OpenDetected = false,
    this.door2OpenDetected = false,
  });

  factory CenterControlAlert.fromJson(Map<String, dynamic> json) =>
      _$CenterControlAlertFromJson(json);
  Map<String, bool> toJson() => _$CenterControlAlertToJson(this);
}
