import 'package:flutter/material.dart';
import 'package:pag_flutter/constants/constants.dart' show CustomColor;

final class Loading extends StatelessWidget {
  final Color color;
  const Loading({super.key, this.color = CustomColor.themeRed});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SizedBox(
          width: 20,
          height: 20,
          child: CircularProgressIndicator(
            color: color,
            strokeWidth: 2,
          ),
        ),
      ),
    );
  }
}
