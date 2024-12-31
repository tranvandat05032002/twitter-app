import 'package:flutter/material.dart';
import 'package:meteor_app/views/home/home_view.dart';
import 'package:meteor_app/views/login/login_page.dart';

class Routers {
  static const String splash = "/";
  static const String login = "/login";
  static const String home = "/home";

  static Route<dynamic> generateRoute(RouteSettings settings) {
    String? routeName = settings.name;
    var argument = settings.arguments;
    switch (routeName) {
      case login:
        return MaterialPageRoute(builder:(_) => LoginPage());
      case home:
        return MaterialPageRoute(builder:(_) => HomeView());
      // case application:
      //   return animRoute(const ApplicationPage());
      // case detailMovie:
      //   if (argument is int) {
      //     return animRoute(DetailMoviePage(movieId: argument));
      //   } else {
      //     throw Exception("argument is not int");
      //   }
      // case watchTrailer:
      //   if (argument is String) {
      //     return animRoute(WatchTrailerPage(videoId: argument));
      //   } else {
      //     throw Exception("argument is not String");
      //   }
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
