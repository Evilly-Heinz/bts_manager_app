// import 'package:bts_manager_app/firebase_options.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
// late AndroidNotificationChannel channel;

// bool isFlutterLocalNotificationsInitialized = false;
// /// Create a [AndroidNotificationChannel] for heads up notifications
// @pragma('vm:entry-point')
// Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
//   await setupFlutterNotifications();
//   showFlutterNotification(message);
//   // If you're going to use other Firebase services in the background, such as Firestore,
//   // make sure you call `initializeApp` before using other Firebase services.
//   print('Handling a background message ${message.messageId}');
// }

// void initFirebaseMessaging() {
//   FirebaseMessaging messaging = FirebaseMessaging.instance;
//   // Configure Firebase Messaging
//   messaging.getToken().then((token) {
//     print('FCM Token: $token');
//   });

//   // Handle incoming messages
//   FirebaseMessaging.onMessage.listen((RemoteMessage message) {
//     print('Received message: ${message.notification?.title}');
//   });

//   // Handle when the app is in the background
//   FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
// }

// Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   print('Handling a background message: ${message.notification?.title}');
// }

// // Show message in notification
// FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
//   print('Opened app from notification: ${message.notification?.title}');
// });

import 'package:firebase_messaging/firebase_messaging.dart';

class MessagingService {
  final FirebaseMessaging _messaging = FirebaseMessaging.instance;

  Future<void> subscribeToTopic(String topic) async {
    try {
      await _messaging.subscribeToTopic(topic);
      print('Successfully subscribed to topic: $topic');
    } catch (e) {
      print('Error subscribing to topic: $e');
    }
  }
}

// Example usage:
void main() async {
  // Initialize the MessagingService
  final messagingService = MessagingService();

  // Subscribe to the "all_users" topic
  await messagingService.subscribeToTopic('all_users');
}
