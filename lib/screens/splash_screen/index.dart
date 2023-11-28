import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pag_flutter/constants/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';

import '../login/index.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key}) {
    initData();
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
