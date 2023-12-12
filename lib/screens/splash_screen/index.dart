import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pag_flutter/constants/colors.dart';
import 'package:pag_flutter/screens/screens.dart';
import 'package:pag_flutter/service/shared_preferences/index.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  static const String routeName = '/';
  static Route route() {
    return MaterialPageRoute(
      builder: (BuildContext context) => const SplashScreen(),
      settings: const RouteSettings(name: routeName),
    );
  }

  Future<bool> checkAuth() async {
    final token = await LocalStorage.shard.getValue(key: 'token');
    if (token == null) {
      return false;
    } else {
      return true;
    }
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3)).then((_) {
      Navigator.of(context).pushNamed(LoginScreen.routeName);
    });
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
