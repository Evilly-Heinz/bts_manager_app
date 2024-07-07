// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'center_control.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CenterControl _$CenterControlFromJson(Map<String, dynamic> json) =>
    CenterControl(
      id: json['id'] as String,
      name: json['name'] as String,
      code: json['code'] as String,
      lastStatusError: json['lastStatusError'] as bool,
      accessToken: json['accessToken'] as String?,
      locationId: json['locationId'] as String,
      location: Location.fromJson(json['location'] as Map<String, dynamic>),
      configuration: json['configuration'] == null
          ? null
          : Configuration.fromJson(
              json['configuration'] as Map<String, dynamic>),
      status: json['status'] == null
          ? null
          : CenterControlStatus.fromJson(
              json['status'] as Map<String, dynamic>),
      alert: json['alert'] == null
          ? null
          : CenterControlAlert.fromJson(json['alert'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CenterControlToJson(CenterControl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'code': instance.code,
      'lastStatusError': instance.lastStatusError,
      'accessToken': instance.accessToken,
      'locationId': instance.locationId,
      'location': instance.location,
      'configuration': instance.configuration,
      'status': instance.status,
      'alert': instance.alert,
    };
