import 'package:bts_manager_app/backend/api_request/authenitcation.dart';
import 'package:bts_manager_app/providers/authentication.provider.dart';
import 'package:flutter/material.dart';
import 'package:bts_manager_app/page/login.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
      providers: [
        Provider(create: (context) => AuthenticationProvider()),
      ],
      child: Consumer<AuthenticationProvider>(
        builder: (context, auth, child) {
          return MyApp();
        },
      )));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final AuthenticationService _authenticationService = AuthenticationService();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
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
            return const MyHomePage(title: 'Home Page');
          } else {
            return const LoginWidget();
          }
        },
      ), // Update the home property to navigate to LoginPage
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
