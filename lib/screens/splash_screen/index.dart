import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pag_flutter/bloc/bloc.dart';
import 'package:pag_flutter/config/config.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.themeRed,
      body: BlocConsumer<TokenBloc, TokenState>(
        listener: (context, state) {
          if ((state.status == Progress.loaded || state.status == Progress.error) && !state.isAuthorized) {
            Navigator.of(context).pushNamed(LoginScreen.routeName);
          }

          if (state.status == Progress.loaded && state.isAuthorized) {
            Navigator.of(context).pushNamed(SplashScreen.routeName);
          }
        },
        builder: (context, state) {
          return Center(
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
          );
        },
      ),
    );
  }
}
