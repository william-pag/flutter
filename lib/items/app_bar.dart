import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppBarCustom extends StatelessWidget {
  const AppBarCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 100,
          height: 50,
          padding: const EdgeInsets.only(top: 5, bottom: 5),
          child: SvgPicture.asset(
            "images/pag.svg",
            width: double.infinity,
            height: double.infinity,
            color: Colors.white,
          ),
        ),
        const Spacer(),
      ],
    );
  }
}
