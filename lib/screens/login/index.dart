import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pag_flutter/bloc/bloc.dart';
import 'package:pag_flutter/constants/constants.dart';
import 'package:pag_flutter/screens/screens.dart';

class Login extends StatelessWidget {
  const Login({super.key});
  static const String routeName = '/login';
  static Route route() {
    return MaterialPageRoute(
      builder: (BuildContext context) => const Login(),
      settings: const RouteSettings(name: routeName),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.themeRed,
      body: BlocProvider<LoginBloc>(
        create: (context) => LoginBloc(),
        child: _LoginContent(),
      ),
    );
  }
}

class _LoginContent extends StatelessWidget {
  _LoginContent();
  final TextEditingController _emailCtrl =
      TextEditingController(text: 'ajohannessen@pag.com');
  final TextEditingController _passwordCtrl =
      TextEditingController(text: 'abc123');

  void signIn(BuildContext context) {
    final email = _emailCtrl.text;
    final password = _passwordCtrl.text;
    context.read<LoginBloc>().add(
          ExecuteLoginEvent(email: email, password: password),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
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
            onPressed: () {
              signIn(context);
            },
            style: ButtonStyle(
                padding: const MaterialStatePropertyAll<EdgeInsets>(
                    EdgeInsets.symmetric(horizontal: 40)),
                backgroundColor:
                    MaterialStatePropertyAll<Color>(Colors.deepPurple[900]!)),
            child: BlocConsumer<LoginBloc, LoginState>(
              listener: (BuildContext context, LoginState state) {
                if (state.btnSignIn == LoginBtnStatus.success) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        'Login successfully',
                        style: TextStyle(color: Colors.white),
                      ),
                      duration: Duration(milliseconds: 500),
                    ),
                  );
                  Navigator.of(context).pushNamed(BottomMenu.routeName);
                }
              },
              builder: (BuildContext context, LoginState state) {
                if (state.btnSignIn == LoginBtnStatus.loading) {
                  return const SizedBox(
                    width: 100,
                    height: 30,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Loading',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        SizedBox(
                          width: 15,
                          height: 15,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  );
                } else {
                  return const Text(
                    'Login',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  );
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
