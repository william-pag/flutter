import 'package:flutter/material.dart';
import 'package:pag_flutter/screens/login/index.dart';
import 'package:pag_flutter/screens/bottom_navigation/bottom_menu.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      home: const BottomMenu(),
      getPages: [
        GetPage(name: '/login', page: () => Login())
      ],
    );
  }
}
