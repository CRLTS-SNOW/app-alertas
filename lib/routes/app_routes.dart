import 'package:flutter/material.dart';

import '../screens/auth/login_screen.dart';

class AppRoutes {
  static const String login = "/login";

  static Map<String, WidgetBuilder> getRoutes() {
    return {login: (context) => const LoginScreen()};
  }
}
