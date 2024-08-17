import 'package:flutter/material.dart';

final defaultAlert = {
  'AC_CURRENT': false,
  'AC_VOLTAGE': false,
  'DC_CURRENT': false,
  'DC_VOLTAGE': false,
  'DISCONNECT': false,
  'FIRE': false,
  'FUEL': false,
  'GENERATOR': false,
  'HEART_BEAT': false,
  'HUMAN': false,
  'HUMIDITY': false,
  'PHASE': false,
  'SMOKE': false,
  'TEMPERATURE': false,
  'UPS': false,
  'WATER': false,
  'DOOR_1': false,
  'DOOR_2': false,
};

class AlertMessage {
  final String centerControlId;
  final String message;
  final Widget icon;
  final String severity;
  final bool isNew;

  AlertMessage({
    required this.centerControlId,
    required this.message,
    required this.icon,
    required this.severity,
    required this.isNew,
  });
}

class AlertValidation {
  final bool valid;
  final List<AlertMessage> errors;

  AlertValidation({
    required this.valid,
    required this.errors,
  });
}
