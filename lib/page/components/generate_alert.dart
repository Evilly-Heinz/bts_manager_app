import 'package:bts_manager_app/models/center_control_alert.dart';
import 'package:flutter/material.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

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
  final String message;
  final Widget icon;
  final String severity;
  final bool isNew;

  AlertMessage({
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

AlertValidation generateAlertMessages(Map<String, bool>? alert,
    Map<String, bool>? currentAlert, BuildContext context) {
  if (alert == null) {
    return generateAlertMessages(defaultAlert, currentAlert, context);
  }
  bool valid = true;
  List<AlertMessage> errors = [
    ...defaultAlert.entries
        .where((entry) => entry.key != 'HEART_BEAT')
        .map((entry) {
      String key = entry.key;
      bool value = alert[key] ?? false;
      String message = '⚠️ Cảnh báo $key đã được kích hoạt.';

      String severity = 'error';
      bool isNew = false;
      IconData symbol = Symbols.warning;
      if (value) {
        valid = false;
        if (currentAlert == null || !currentAlert.containsKey(key)) {
          isNew = true;
        }
      }

      switch (key) {
        case 'FIRE':
          message = value ? 'Cảnh báo cháy' : 'Không phát hiện cháy';
          symbol = Symbols.local_fire_department_rounded;

          break;
        case 'SMOKE':
          message = value ? 'Phát hiện khói!' : 'Không phát hiện khói';
          symbol = Symbols.detector_smoke_rounded;
          break;
        case 'WATER':
          message = value
              ? 'Mức nước vượt quá giới hạn! Hãy kiểm tra rò rỉ hoặc tràn nước.'
              : 'Mực nước trong giới hạn';
          symbol = Symbols.flood_rounded;
          break;
        case 'TEMPERATURE':
          message = value
              ? 'Nhiệt độ nằm ngoài ngưỡng cho phép!'
              : 'Nhiệt độ trong mức cho phép';
          symbol = Symbols.device_thermostat_rounded;
          break;
        case 'HUMIDITY':
          message = value
              ? 'Độ ẩm nằm ngoài ngưỡng cho phép!'
              : 'Độ ẩm nằm trong ngưỡng cho phép';
          symbol = Symbols.humidity_percentage_rounded;
          break;
        case 'DC_CURRENT':
          message = value
              ? 'Quá tải dòng điện DC!'
              : 'Dòng điện DC hoạt động bình thường';
          symbol = Symbols.battery_alert_rounded;
          break;
        case 'DC_VOLTAGE':
          message = value ? 'Điện áp DC cao!' : 'Điện áp DC ở mức bình thường';
          symbol = Symbols.battery_charging_full_rounded;
          break;
        case 'AC_CURRENT':
          message = value
              ? 'Quá tải dòng điện AC!'
              : 'Dòng điện AC hoạt động bình thường';
          symbol = Symbols.flash_on_rounded;
          break;
        case 'AC_VOLTAGE':
          message = value ? 'Điện áp AC cao!' : 'Điện áp AC ở mức bình thường';
          symbol = Symbols.bolt_rounded;
          break;
        case 'FUEL':
          message = value
              ? 'Mức nhiên liệu thấp được phát hiện!'
              : 'Mức nhiên liệu vẫn còn đủ';
          symbol = Symbols.local_gas_station_rounded;
          break;
        case 'HUMAN':
          message = value
              ? 'Phát hiện sự hiện diện trái phép!'
              : 'Không phát hiện xâm nhập trái phép';
          symbol = Symbols.directions_run_rounded;
          break;
        case 'UPS':
          message = value
              ? 'Đang sử dụng nguồn UPS!'
              : 'Nguồn UPS không được sử dụng';
          severity = 'info';
          symbol = Symbols.battery_charging_full_rounded;
          break;
        case 'GENERATOR':
          message = value
              ? 'Máy phát điện đã được kích hoạt!'
              : 'Máy phát điện không được kích hoạt';
          severity = 'info';
          symbol = Symbols.wind_power_rounded;
          break;
        case 'DISCONNECT':
          message = value
              ? 'Nguồn điện bị ngắt kết nối!'
              : 'Nguồn điện kết nối ổn định';
          severity = 'info';
          symbol = Icons.power_off;
          break;
        case 'PHASE':
          message =
              value ? 'Phát hiện mất cân bằng pha!' : 'Pha hoạt động ổn định';
          symbol = Icons.settings_input_component;
          break;
        case 'DOOR_1':
          message = value ? 'Phát hiện cửa số 1 đang mở!' : 'Cửa số 1 đóng';
          symbol = Symbols.door_front_door_rounded;
          break;
        case 'DOOR_2':
          message = value ? 'Phát hiện cửa số 2 đang mở!' : 'Cửa số 2 đóng';
          symbol = Symbols.door_back_door_rounded;
          break;
      }

      return AlertMessage(
        message: message,
        icon: Icon(
          symbol,
          color: value ? Colors.red : Colors.grey,
          size: 24,
          fill: value ? 1 : 0,
        ),
        severity: severity,
        isNew: isNew,
      );
    })
  ];

  errors.sort((a, b) {
    if (a.isNew != b.isNew) {
      return a.isNew ? -1 : 1;
    } else {
      if (a.severity == 'error' && b.severity != 'error') {
        return -1;
      } else if (a.severity != 'error' && b.severity == 'error') {
        return 1;
      } else if (a.severity == 'warning' && b.severity == 'info') {
        return -1;
      } else if (a.severity == 'info' && b.severity == 'warning') {
        return 1;
      } else {
        return 0;
      }
    }
  });
  return AlertValidation(valid: valid, errors: errors);
}

bool validateAlert(CenterControlAlert? alert) {
  if (alert == null) {
    return true;
  }
  Map<String, bool> alertMap = alert.toJson();
  List errors = alertMap.entries.where((entry) => entry.value).toList();
  return errors.isEmpty;
}
