import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pag_flutter/constants/colors.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.themeRed,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 100,
              height: 50,
              child: SvgPicture.asset(
                "images/pag.svg",
                width: double.infinity,
                height: double.infinity,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              width: double.infinity, // Full width of the screen
              decoration: const BoxDecoration(
                border: Border(bottom: BorderSide(width: 1, color: Colors.white)), // Optional border
              ),
              margin: const EdgeInsets.symmetric(horizontal: 30),
              child: const TextField(
                decoration: InputDecoration.collapsed(hintText: 'Username'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
