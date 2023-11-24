import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
            FractionallySizedBox(
              widthFactor: 0.7,
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                          width: 1, color: Colors.white)), // Optional border
                ),
                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                child: const TextField(
                  decoration: InputDecoration.collapsed(
                      hintText: 'Username',
                      hintStyle:
                          TextStyle(color: Colors.white, letterSpacing: 1.0)),
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            FractionallySizedBox(
              widthFactor: 0.7,
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                          width: 1, color: Colors.white)), // Optional border
                ),
                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                child: const TextField(
                  decoration: InputDecoration.collapsed(
                      hintText: 'Password',
                      hintStyle:
                          TextStyle(color: Colors.white, letterSpacing: 1.0)),
                  style: TextStyle(color: Colors.white),
                  obscureText: true,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            FilledButton(
              onPressed: () {},
              style: ButtonStyle(
                  padding: const MaterialStatePropertyAll<EdgeInsets>(
                      EdgeInsets.symmetric(horizontal: 40)),
                  backgroundColor:
                      MaterialStatePropertyAll<Color>(Colors.deepPurple[900]!)),
              child: const Text(
                'Login',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            )
          ],
        ),
      ),
    );
  }
}
