import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pag_flutter/bloc/me/me_bloc.dart';
import 'package:pag_flutter/components/components.dart';
import 'package:pag_flutter/config/enum.dart';
import 'package:pag_flutter/screens/login/index.dart';

class BoxUserInfo extends StatelessWidget {
  const BoxUserInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MeBloc, MeState>(
      listener: (BuildContext context, MeState state) {
        if (state.status == Progress.error ||
            (state.status == Progress.loaded && state.me == null)) {
          Navigator.of(context).pushNamed(LoginScreen.routeName);
        }
      },
      builder: (BuildContext context, MeState state) {
        if (state.status == Progress.loaded) {
          final me = state.me!;
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(me.image),
              ),
              const SizedBox(height: 10),
              Text(
                me.name,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              Text(
                me.email,
                style: const TextStyle(
                  color: Colors.white60,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ],
          );
        }
        return const Loading(color: Colors.white);
      },
    );
  }
}
