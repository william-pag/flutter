import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pag_flutter/constants/colors.dart';

class Login extends StatelessWidget {
  Login({super.key});
  static const String routeName = '/login';
  static Route route() {
    return MaterialPageRoute(builder: (BuildContext context) => Login(), settings: const RouteSettings(name: routeName),);
  }

  final TextEditingController _emailCtrl = TextEditingController();
  final TextEditingController _passwordCtrl = TextEditingController();

  void signIn() {
    // final email = _emailCtrl.text;
    // final password = _passwordCtrl.text;
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
              child: SizedBox(
                width: double.infinity,
                height: 40,
                child: TextField(
                  controller: _emailCtrl,
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.white, width: 1.0)),
                      border: OutlineInputBorder(
                        // width: 0.0 produces a thin "hairline" border
                        borderSide: BorderSide(color: Colors.white, width: 1.0),
                      ),
                      hoverColor: Colors.white,
                      labelText: 'Email',
                      labelStyle: TextStyle(color: Colors.white)),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            FractionallySizedBox(
              widthFactor: 0.7,
              child: SizedBox(
                width: double.infinity,
                height: 40,
                child: TextField(
                  controller: _passwordCtrl,
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.white, width: 1.0)),
                      border: OutlineInputBorder(
                        // width: 0.0 produces a thin "hairline" border
                        borderSide: BorderSide(color: Colors.white, width: 1.0),
                      ),
                      hoverColor: Colors.white,
                      labelText: 'Password',
                      labelStyle: TextStyle(color: Colors.white)),
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
