import 'package:flutter/material.dart';
import 'package:pag_flutter/screens/screens.dart';

class AppRouter {
  static Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case SplashScreen.routeName:
        return SplashScreen.route();
      case Login.routeName:
        return Login.route();
      case BottomMenu.routeName:
        return BottomMenu.route();
      default:
        return Error.route();
    }
  }
}
