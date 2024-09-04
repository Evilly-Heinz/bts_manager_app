import 'dart:async';

import 'package:bts_manager_app/models/center_control.dart';
import 'package:bts_manager_app/page/components/adaptive_grid.dart';
import 'package:bts_manager_app/page/components/airconditioner_control.dart';
import 'package:bts_manager_app/page/components/on_off_control.dart';
import 'package:bts_manager_app/providers/mqtt.provider.dart';
import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

double parseDouble(dynamic value) {
  if (value is String) {
    return double.parse(value);
  } else if (value is int) {
    return value.toDouble();
  } else {
    return value;
  }
}
class QuickControl extends StatefulWidget {
  final CenterControl centerControl;
  const QuickControl({super.key, required this.centerControl});

  @override
  State<QuickControl> createState() => _QuickControlState();
}

class _QuickControlState extends State<QuickControl> {
  bool autoControl = true;
  Map<String, dynamic> command = {};
  Timer? _debounce;
  late MQTTClientProvider mqttClientProvider;
  @override
  void initState() {
    super.initState();
    mqttClientProvider =
        Provider.of<MQTTClientProvider>(context, listen: false);
    command = {
      'AIR_CONDITION_STATUS':
          widget.centerControl.status?.airConditionStatus ?? false,
      'AIR_CONDITION_STATUS_2':
          widget.centerControl.status?.airConditionStatus2 ?? false,
      'AIR_CONDITION_TEMP':
          widget.centerControl.status?.airConditionTemperature ?? 16.0,
      'AIR_CONDITION_TEMP_2':
          widget.centerControl.status?.airConditionTemperature2 ?? 16.0,
      'ALARM': widget.centerControl.status?.fireAlarmStatus ?? false,
      'FAN': widget.centerControl.status?.heatPumpStatus ?? false,
      'AUTO_CONTROL': autoControl,
      'timestamp': DateTime.now().millisecondsSinceEpoch,
    };
    mqttClientProvider.command.listen((event) {
      if (event['timestamp'] == command['timestamp']) {
        return;
      }
      if (mounted) {
        setState(() {
          command = event;
          autoControl = event['AUTO_CONTROL'];
        });
      }
    });
  }

  void sendControlMessage() {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      mqttClientProvider.sendCommand(widget.centerControl, command);
    });
  }

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: [
            OnOffControl(
              title: command['AUTO_CONTROL']
                  ? 'Điều khiển máy lạnh tự động'
                  : 'Điều khiển máy lạnh bằng tay',
              initStatus: autoControl,
              decorationColor: const Color(0xFFC1D3FE),
              onControlSateChange: (value) {
                setState(() {
                  command['AUTO_CONTROL'] = value;
                  command['timestamp'] = DateTime.now().millisecondsSinceEpoch;
                });
                sendControlMessage();
              },
            ),
          ],
        ),
        AdaptiveGrid(children: [
          AirconditionerControl(
            readOnly: command['AUTO_CONTROL'],
            initStatus: command['AIR_CONDITION_STATUS'],
            initTemperature: parseDouble(command['AIR_CONDITION_TEMP']),
            title: "Điều hòa 1",
            decorationColor: const Color(0xFFCAFEBE),
            onControlSateChange: (temperature, status) {
              setState(() {
                command['AIR_CONDITION_TEMP'] = temperature;
                command['AIR_CONDITION_STATUS'] = status;
                command['timestamp'] = DateTime.now().millisecondsSinceEpoch;
              });
              sendControlMessage();
            },
          ),
          AirconditionerControl(
            readOnly: command['AUTO_CONTROL'],
            initStatus: command['AIR_CONDITION_STATUS_2'],
            initTemperature: parseDouble(command['AIR_CONDITION_TEMP_2']),
            title: "Điều hòa 2",
            decorationColor: const Color(0xFFFDBBD4),
            onControlSateChange: (temperature, status) {
              setState(() {
                command['AIR_CONDITION_TEMP_2'] = temperature;
                command['AIR_CONDITION_STATUS_2'] = status;
                command['timestamp'] = DateTime.now().millisecondsSinceEpoch;
              });
              sendControlMessage();
            },
          ),
        ]),
        const SizedBox(
          height: 8,
        ),
        AdaptiveGrid(
          children: [
            OnOffControl(
              title: 'Quạt thông gió',
              initStatus: command['FAN'] ?? false,
              decorationColor: const Color(0xFFC1D3FE),
              onControlSateChange: (value) {
                setState(() {
                  command['FAN'] = value;
                  command['timestamp'] = DateTime.now().millisecondsSinceEpoch;
                });
                sendControlMessage();
              },
            ),
            OnOffControl(
              title: 'Chuông báo',
              initStatus: command['ALARM'] ?? false,
              decorationColor: const Color(0xFFFECCBE),
              onControlSateChange: (value) {
                setState(() {
                  command['ALARM'] = value;
                  command['timestamp'] = DateTime.now().millisecondsSinceEpoch;
                });
                sendControlMessage();
              },
            )
          ],
        ),
        const SizedBox(
          height: 8,
        ),
        Row(
          children: [
            Expanded(
              child: ElevatedButton(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Wrap(children: [
                    const Icon(
                      Symbols.speed_camera_rounded,
                      color: Colors.blue,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      'Mở camera giám sát',
                      style: Theme.of(context).textTheme.bodyLarge!,
                    ),
                  ]),
                ),
                onPressed: () async {
                  if (widget.centerControl.configuration == null ||
                      widget.centerControl.configuration?.cameraLink == null) {
                    return;
                  }
                  final String link =
                      widget.centerControl.configuration!.cameraLink!;
                  final Uri url = Uri.parse(link);
                  if (!await launchUrl(url)) {
                    if (context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                              'Không thể mở camera. Vui lòng kiểm tra cấu hình'),
                        ),
                      );
                    }
                  }
                },
              ),
            )
          ],
        )
      ],
    );
  }
}
