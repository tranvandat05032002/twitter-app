import 'package:flutter/material.dart';
import 'package:meteor_app/views/edit_profile/edit_profile_page.dart';
import 'package:meteor_app/views/home/home_view.dart';
import 'package:meteor_app/views/login/login_page.dart';
import 'package:meteor_app/views/profile/profile_page.dart';

class Routers {
  static const String splash = "/";
  static const String login = "/login";
  static const String home = "/home";
  static const String profile = "/profile";
  static const String editProfile = "/editProfile";

  static Route<dynamic> generateRoute(RouteSettings settings) {
    String? routeName = settings.name;
    var argument = settings.arguments;
    switch (routeName) {
      case login:
        return MaterialPageRoute(builder:(_) => LoginPage());
      case home:
        return MaterialPageRoute(builder:(_) => HomeView());
      case profile:
        return MaterialPageRoute(builder:(_) => ProfilePage());
      case editProfile:
        return MaterialPageRoute(builder: (_) => EditProfilePage());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }

}
