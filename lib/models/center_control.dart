import 'package:json_annotation/json_annotation.dart';

import 'center_control_alert.dart';
import 'center_control_status.dart';
import 'configuration.dart';
import 'location.dart';
part 'center_control.g.dart';

@JsonSerializable()
class CenterControl {
  final String id;
  final String name;
  final String code;
  bool lastStatusError;
  final String? accessToken;
  final String locationId;
  final Location location;
  final Configuration? configuration;
  CenterControlStatus? status;
  CenterControlAlert? alert;

  CenterControl({
    required this.id,
    required this.name,
    required this.code,
    required this.lastStatusError,
    this.accessToken,
    required this.locationId,
    required this.location,
    this.configuration,
    this.status,
    this.alert,
  });

  factory CenterControl.fromJson(Map<String, dynamic> json) =>
      _$CenterControlFromJson(json);
  Map<String, dynamic> toJson() => _$CenterControlToJson(this);
}
