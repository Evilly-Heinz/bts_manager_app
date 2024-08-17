import 'package:bts_manager_app/models/mqtt_topic.dart';

class MqttMessageutils {
  // Add your utility methods here

  static MqttTopic parseTopic(String topic) {
    final splitString = topic.split('/');
    if (splitString.length < 4) {
      return MqttTopic(
          action: '',
          prefix: '',
          message: '',
          areaCode: '',
          centerControlCode: '');
    }
    return MqttTopic(
        action: splitString[1],
        areaCode: splitString[2],
        centerControlCode: splitString[3],
        prefix: splitString[0],
        message: '');
  }
}
