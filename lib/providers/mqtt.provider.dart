import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:bts_manager_app/common/utils/mqtt_message_utils.dart';
import 'package:bts_manager_app/models/alert_notification.dart';
import 'package:bts_manager_app/models/center_control.dart';
import 'package:bts_manager_app/models/center_control_status.dart';
import 'package:bts_manager_app/page/components/generate_alert.dart';
import 'package:bts_manager_app/models/setting.dart';
import 'package:flutter/material.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';

/// The client disconnect callback type

AlertMessage connectMessage(String message) {
  return AlertMessage(
    centerControlId: '_',
    message: message,
    severity: 'info',
    icon: const Icon(Icons.check),
    isNew: true,
  );
}

class MQTTClientProvider {
  late MqttServerClient client;
  final appPrefix = 'CloudBTS';
  final MqttConnectionState connectStatus = MqttConnectionState.disconnected;

  final StreamController<AlertMessage> _alertManager =
      StreamController.broadcast();
  Stream<AlertMessage> get alert => _alertManager.stream;

  final StreamController<CenterControlStatus> centerController =
      StreamController.broadcast();
  Stream<CenterControlStatus> get centerControl => centerController.stream;

  final StreamController<Map<String, dynamic>> commandController =
      StreamController.broadcast();
  Stream<Map<String, dynamic>> get command => commandController.stream;
  MQTTClientProvider();
  Future<MqttClientConnectionStatus?> connect(Setting setting) async {
    if (connectStatus != MqttConnectionState.disconnected) {
      return null;
    }
    connectStatus == MqttConnectionState.connecting;
    client =
        MqttServerClient.withPort(setting.mqttHostName, 'mobile-app', 8883);
    client.secure = true;
    client.securityContext = SecurityContext.defaultContext;
    client.keepAlivePeriod = 60;
    client.autoReconnect = true;
    client.logging(on: true);
    client.onConnected = () {
      _alertManager.add(connectMessage('Đã kết nối tới máy trạm'));
      connectStatus == MqttConnectionState.connected;
    };
    client.onDisconnected = () {
      _alertManager.add(connectMessage('Đã ngắt kết nối tới máy trạm'));
      connectStatus == MqttConnectionState.disconnected;
    };
    MqttClientConnectionStatus? status;
    try {
      status = await client.connect(setting.mqttUsername, setting.mqttPassword);
      if (status!.state == MqttConnectionState.connected) {
        client.subscribe('$appPrefix/alert/#', MqttQos.atLeastOnce);
        client.updates!.listen((List<MqttReceivedMessage<MqttMessage>> event) {
          final MqttPublishMessage message =
              event[0].payload as MqttPublishMessage;
          final payload =
              MqttPublishPayload.bytesToStringAsString(message.payload.message);
          final topic = MqttMessageutils.parseTopic(event[0].topic);
          if (topic.action == 'alert') {
            final alert = jsonDecode(payload);
            AlertValidation alertValidation =
                generateAlertMessages(topic.centerControlCode, alert, null);
            for (var alertMessage in alertValidation.errors) {
              if (alertMessage.isNew) {
                _alertManager.add(alertMessage);
              }
            }
          } else if (topic.action == 'status') {
            final status = CenterControlStatus.fromMqttMessage(
                topic.centerControlCode, jsonDecode(payload));
            centerController.add(status);
          } else if (topic.action == 'control') {
            final command = jsonDecode(payload);
            if (command['timestamp'] != null) {
              command['timestamp'] =
                  DateTime.fromMillisecondsSinceEpoch(command['timestamp']);
            }
            commandController.add(command);
          }
        });
      }
    } on Exception {
      client.disconnect();
    }
    return status;
  }

  void disconnect() {
    client.disconnect();
    connectStatus == MqttConnectionState.disconnected;
  }

  void publish(String topic, String message) {
    final builder = MqttClientPayloadBuilder();
    builder.addString(message);
    client.publishMessage(topic, MqttQos.atLeastOnce, builder.payload!);
  }

  void subscribe(CenterControl centerControl) {
    client.subscribe(
        '$appPrefix/status/${centerControl.location.area}/${centerControl.code}',
        MqttQos.atMostOnce);
    client.subscribe(
        '$appPrefix/control/${centerControl.location.area}/${centerControl.code}',
        MqttQos.atMostOnce);
  }

  void unsubscribe(CenterControl centerControl) {
    client.unsubscribe(
        '$appPrefix/status/${centerControl.location.area}/${centerControl.code}');
    client.unsubscribe(
        '$appPrefix/control/${centerControl.location.area}/${centerControl.code}');
  }

  void sendCommand(
      CenterControl selectedCenterControl, Map<String, dynamic> data) {
    publish(
      '$appPrefix/control/${selectedCenterControl.location.area}/${selectedCenterControl.code}',
      jsonEncode(data),
    );
  }

  void dispose() {
    _alertManager.close();
  }
}
