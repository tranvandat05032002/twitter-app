import 'package:flutter/material.dart';
import 'package:meteor_app/remote/api_service.dart';
import 'package:meteor_app/viewmodels/auth_viewmodel.dart';
import 'package:meteor_app/views/Login/LoginPage.dart';
import 'package:meteor_app/views/Dashboard.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:dio/dio.dart';
import 'package:provider/provider.dart';
import 'package:meteor_app/repository/auth_repository.dart';

void main() async {
  final dio = Dio();
  final apiService = ApiService(dio);
  final authRepository = AuthRepository(apiService);
  await dotenv.load(fileName: ".env");
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => AuthViewModel(authRepository))
    ],
    child: MyApp(),
  ));
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
