import 'dart:io';

import 'package:bts_manager_app/backend/api_request/authenitcation.dart';
import 'package:bts_manager_app/firebase_options.dart';
import 'package:bts_manager_app/page/bts_list_page.dart';
import 'package:bts_manager_app/providers/authentication.provider.dart';
import 'package:bts_manager_app/providers/mqtt.provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:bts_manager_app/page/login.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'providers/alert_manager.dart';

Future<void> setupFlutterNotifications() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final notificationSettings =
      await FirebaseMessaging.instance.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );
  if (notificationSettings.authorizationStatus ==
      AuthorizationStatus.authorized) {
    final apnsToken = await FirebaseMessaging.instance.getAPNSToken();
    final token = await FirebaseMessaging.instance.getToken();
    if (apnsToken != null || token != null) {
      // APNS token is available, make FCM plugin API requests...
    }
  }
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  if (!kIsWeb && defaultTargetPlatform == TargetPlatform.android) {
    await setupFlutterNotifications();
  }

  runApp(MultiProvider(
      providers: [
        Provider(create: (context) => AuthenticationProvider()),
        ChangeNotifierProvider(create: (context) => AlertManager()),
        Provider(create: (context) => MQTTClientProvider()),
      ],
      child: Consumer<AuthenticationProvider>(
        builder: (context, auth, child) {
          return const Application();
        },
      )));
}

/// Renders the example application.
class Application extends StatefulWidget {
  const Application({super.key});
  @override
  State<StatefulWidget> createState() => _Application();
}

class _Application extends State<Application> {
  String? initialMessage;
  Future<void> setupInteractedMessage() async {
    // Get any messages which caused the application to open from
    // a terminated state.
    RemoteMessage? initialMessage =
        await FirebaseMessaging.instance.getInitialMessage();
    // If the message also contains a data property with a "type" of "chat",
    // navigate to a chat screen
    if (initialMessage != null) {
      _handleMessage(initialMessage);
    }

    // Also handle any interaction when the app is in the background via a
    // Stream listener
    FirebaseMessaging.onMessageOpenedApp.listen(_handleMessage);
  }

  void _handleMessage(RemoteMessage message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Message data: ${message.data}'),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) {
      setupInteractedMessage();
    }
  }

  final AuthenticationService _authenticationService = AuthenticationService();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BTS Manager',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(1, 9, 10, 100),
            primary: const Color.fromARGB(1, 9, 10, 100),
            secondary: const Color.fromARGB(1, 237, 28, 36)),
        useMaterial3: true,
        textTheme: GoogleFonts.playTextTheme(),
        cardTheme: CardTheme(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
      home: FutureBuilder<String?>(
        future: _authenticationService.getAccessToken(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const BtsListPage();
          } else {
            return const LoginWidget();
          }
        },
      ), // Update the home property to navigate to LoginPage
    );
  }
}
