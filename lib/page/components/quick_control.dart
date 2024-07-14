import 'package:bts_manager_app/models/center_control.dart';
import 'package:bts_manager_app/page/components/adaptive_grid.dart';
import 'package:bts_manager_app/page/components/airconditioner_control.dart';
import 'package:bts_manager_app/page/components/on_off_control.dart';
import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:url_launcher/url_launcher.dart';

class QuickControl extends StatefulWidget {
  final CenterControl centerControl;
  const QuickControl({super.key, required this.centerControl});

  @override
  State<QuickControl> createState() => _QuickControlState();
}

class _QuickControlState extends State<QuickControl> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AdaptiveGrid(children: [
          AirconditionerControl(
            initStatus: widget.centerControl.status!.airConditionStatus,
            initTemperature:
                widget.centerControl.status!.airConditionTemperature,
            title: "Điều hòa 1",
          ),
          AirconditionerControl(
            initStatus: widget.centerControl.status!.airConditionStatus2,
            initTemperature:
                widget.centerControl.status!.airConditionTemperature2,
            title: "Điều hòa 2",
          ),
        ]),
        const SizedBox(
          height: 8,
        ),
        AdaptiveGrid(
          children: [
            OnOffControl(
              title: 'Quạt thông gió',
              initStatus: widget.centerControl.status?.heatPumpStatus ?? false,
            ),
            OnOffControl(
              title: 'Chuông báo',
              initStatus: widget.centerControl.status?.fireAlarmStatus ?? false,
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
