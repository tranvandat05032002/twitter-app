import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:meteor_app/utils/provider_setup.dart';
import 'package:meteor_app/utils/routers.dart';
import 'package:provider/provider.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  runApp(MultiProvider(providers: providers, 
  child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      initialRoute: Routers.login,
      debugShowCheckedModeBanner: false,
      onGenerateRoute: Routers.generateRoute,
      // routes: {
      //   '/login': (context) => LoginPage(),
      //   // '/home': (context) => Home(),
      // },
    );
  }
}
