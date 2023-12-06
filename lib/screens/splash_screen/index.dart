import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pag_flutter/constants/colors.dart';
import 'package:pag_flutter/screens/screens.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key}) {
    initData();
  }
  static const String routeName = '/';
  static Route route() {
    return MaterialPageRoute(
      builder: (BuildContext context) => SplashScreen(),
      settings: const RouteSettings(name: routeName),
    );
  }
  void initData() {
    // SharedPreferences.getInstance().then((SharedPreferences store) {
    //   String? token = store.getString('token');
    //   if (token == null) {
    //     if (kIsWeb) {
    //       Get.toNamed('/login');
    //     } else {
    //       Get.to(Login());
    //     }
    //   }
    // }, onError: (error) {
    //   print([16, error.toString()]);
    // });
  }

  @override
  Widget build(BuildContext context) {
    Timer(
      const Duration(seconds: 2),
      () {
        Navigator.pushReplacementNamed(context, Login.routeName);
      },
    );
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
