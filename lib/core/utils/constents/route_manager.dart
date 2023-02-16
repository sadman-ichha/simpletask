import 'package:flutter/material.dart';
import 'package:jobtask/feature/presentation/chat_screen/views/chat_screen.dart';
import 'package:jobtask/feature/presentation/home_screen/views/home_screen.dart';
import 'package:jobtask/feature/presentation/signin_screen/views/signin_screen.dart';

class Routes {
  static const String signinScreen = "/signInScreen";
  static const String chatScreen = "/chatScreen";
  static const String homeScreen = "/homeScreen";
}

class AppRoutes {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.signinScreen:
        return MaterialPageRoute(
          builder: (_) =>  SignInScreeen(),
        );

      case Routes.chatScreen:
        return MaterialPageRoute(
          builder: (_) => const ChatScreen(),
        );

        case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (_) =>  HomeScreen(),
        );
    }
    return null;
  }
}
