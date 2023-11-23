import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pag_flutter/constants/colors.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
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
      ),
    );
  }
}