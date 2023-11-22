import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppBarCustom extends StatelessWidget {
  final String avatar;
  final String name;
  const AppBarCustom({super.key, required this.avatar, required this.name});
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
        Container(
          height: 50,
          padding: const EdgeInsets.only(top: 5, bottom: 5, right: 10),
          child:
          Row(
            children: [
              Text(name.replaceAll(" ", "\n"), style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 14,), textAlign: TextAlign.end,),
              const SizedBox(width: 10,),
              Image.network(avatar, width: 40, height: 40,)
            ],
          ),
        ),
      ],
    );
  }
}
