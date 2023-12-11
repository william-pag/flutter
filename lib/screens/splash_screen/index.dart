import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pag_flutter/constants/colors.dart';
import 'package:pag_flutter/screens/screens.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  static const String routeName = '/';
  static Route route() {
    return MaterialPageRoute(
      builder: (BuildContext context) => const SplashScreen(),
      settings: const RouteSettings(name: routeName),
    );
  }
  void initData(BuildContext context) {
    Future.delayed(const Duration(seconds: 5)).then((value) {
      Navigator.pushReplacementNamed(context, LoginScreen.routeName);
    });
  }

  @override
  Widget build(BuildContext context) {
    initData(context);
    return Scaffold(
      backgroundColor: CustomColor.themeRed,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 200,
              height: 100,
              child: SvgPicture.asset(
                "images/pag.svg",
                width: double.infinity,
                height: double.infinity,
                color: Colors.white,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20),
              child: const CircularProgressIndicator(color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
