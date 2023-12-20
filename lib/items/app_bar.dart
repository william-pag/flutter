import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pag_flutter/bloc/bloc.dart' show MeBloc, LoadMe, MeState;
import 'package:pag_flutter/components/components.dart' show Loading;
import 'package:pag_flutter/config/config.dart' show Progress;
import 'package:pag_flutter/screens/screens.dart' show LoginScreen;

class AppBarCustom extends StatelessWidget {
  const AppBarCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return const _AppBarCustom();
  }
}

class _AppBarCustom extends StatelessWidget {
  const _AppBarCustom();

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
          child: BlocConsumer<MeBloc, MeState>(
            listener: (BuildContext context, MeState state) {
              if (state.status == Progress.error ||
                  (state.status == Progress.loaded && state.me == null)) {
                Navigator.of(context).pushNamed(LoginScreen.routeName);
              }
            },
            builder: (BuildContext context, MeState state) {
              if (state.status == Progress.loaded) {
                return Row(
                  children: [
                    Text(
                      state.me!.name.replaceAll(" ", "\n"),
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 14,
                      ),
                      textAlign: TextAlign.end,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                        ),
                        child: Image.network(state.me!.image),
                      ),
                    )
                  ],
                );
              }
              return const Loading(color: Colors.white);
            },
          ),
        ),
      ],
    );
  }
}
