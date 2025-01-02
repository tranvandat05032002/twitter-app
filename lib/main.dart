import 'package:flutter/material.dart';
import 'package:meteor_app/viewmodels/auth_viewmodel.dart';
import 'package:meteor_app/utils/app_shared.dart';
import 'package:meteor_app/views/Login/LoginPage.dart';
import 'package:meteor_app/views/Dashboard.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Tải các biến môi trường từ tệp .env
  await dotenv.load(fileName: ".env");

  runApp(
    MultiProvider(
      providers: [
        Provider.value(value: TokenManager()), // Quản lý token
        ChangeNotifierProvider(
          create: (_) =>
              AuthViewModel(), // Sử dụng AuthViewModel không phụ thuộc vào AuthRepository
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/login', // Đặt màn hình mặc định là Login
      debugShowCheckedModeBanner: false,
      routes: {
        '/login': (context) => Login(),
        '/home': (context) => Dashboard(),
      },
    );
  }
}
