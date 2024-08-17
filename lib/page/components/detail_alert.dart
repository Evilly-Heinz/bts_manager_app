import 'package:bts_manager_app/models/alert_notification.dart';
import 'package:bts_manager_app/models/center_control.dart';
import 'package:flutter/material.dart';

import 'generate_alert.dart';

class DetailAlert extends StatefulWidget {
  final CenterControl centerControl;

  const DetailAlert({super.key, required this.centerControl});

  @override
  State<DetailAlert> createState() => _DetailAlertState();
}

class _DetailAlertState extends State<DetailAlert> {
  @override
  Widget build(BuildContext context) {
    AlertValidation alertValidation = generateAlertMessages(
        widget.centerControl.id,
      widget.centerControl.alert?.toJson(),
      null
    );
    List<AlertMessage> alertMessages = alertValidation.errors;
    return Column(
      children: [
        Text(
          'Thông tin cảnh báo ${widget.centerControl.name}',
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 16),
        Expanded(
          child: SingleChildScrollView(
            child: Card(
              clipBehavior: Clip.antiAlias,
              child: ListView.separated(
                shrinkWrap: true,
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 4),
                itemCount: alertMessages.length,
                itemBuilder: (context, index) {
                  AlertMessage alertMessage = alertMessages[index];
                  return ListTile(
                      tileColor: alertMessage.isNew &&
                              alertMessage.severity == 'error'
                          ? Theme.of(context).colorScheme.error.withAlpha(30)
                          : null,
                      title: Text(alertMessage.message),
                      leading: alertMessage.icon);
                },
                separatorBuilder: (context, index) => const Divider(
                  height: 1,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
