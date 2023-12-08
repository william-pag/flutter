import 'package:flutter/material.dart';
import 'package:pag_flutter/screens/screens.dart';

class AppRouter {
  static Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case SplashScreen.routeName:
        return SplashScreen.route();
      case LoginScreen.routeName:
        return LoginScreen.route();
      case BottomMenu.routeName:
        return BottomMenu.route();
      default:
        return Error.route();
    }
  }
}
