import 'package:flutter/material.dart';

class Error extends StatelessWidget {
  const Error({super.key});

  static const String routeName = 'error';
  static Route route() {
    return MaterialPageRoute(
      builder: (BuildContext context) => const Error(),
      settings: const RouteSettings(name: routeName),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}