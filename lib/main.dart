import 'package:flutter/material.dart';
import 'package:meteor_app/views/Login/LoginPage.dart';
import 'package:meteor_app/views/Dashboard.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/home',
      debugShowCheckedModeBanner: false,
      routes: {
        '/login': (context) => Login(),
        '/home': (context) => Dashboard(),
      },
    );
  }
}
