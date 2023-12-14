import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pag_flutter/bloc/bloc.dart'
    show UsersBloc, UsersState, SelectUser, UsersLoading;
import 'package:pag_flutter/config/config.dart' show Progress;
import 'package:pag_flutter/constants/constants.dart'
    show CustomColor, CustomIcons;
import 'package:pag_flutter/model/model.dart' show UserModel;
import 'package:pag_flutter/screens/screens.dart' show LoginScreen;

class Reminder extends StatelessWidget {
  const Reminder({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext _) => UsersBloc()..add(UsersLoading()),
        ),
      ],
      child: const _Reminder(),
    );
  }
}

class _Reminder extends StatelessWidget {
  const _Reminder();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity, // Full width of the screen
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey), // Optional border
            borderRadius: BorderRadius.circular(5), // Optional border radius
          ),
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: BlocConsumer<UsersBloc, UsersState>(
            listener: (context, state) {
              if (state.status == Progress.error) {
                Navigator.of(context).pushNamed(LoginScreen.routeName);
              }
            },
            builder: (BuildContext context, UsersState state) {
              if (state.status == Progress.loaded) {
                return DropdownButton<UserModel>(
                  underline: Container(),
                  isExpanded: true, // Fill the width of the container
                  value: state.selectedUser,
                  onChanged: (UserModel? newValue) {
                    if (newValue != null) {
                      context.read<UsersBloc>().add(SelectUser(user: newValue));
                    }
                  },
                  icon: Container(
                    decoration: const BoxDecoration(
                      border: Border(
                        left: BorderSide(
                          color: Colors.grey, // Border color
                          width: 2, // Border width
                        ),
                      ), // Optional border
                    ),
                    padding: const EdgeInsets.only(left: 5),
                    child: CustomIcons.shared.caretDown,
                  ),
                  items: state.users.map((UserModel user) {
                    return DropdownMenuItem<UserModel>(
                      key: Key(user.id.toString()),
                      value: user,
                      child: Text(
                        user.name,
                        style: const TextStyle(fontWeight: FontWeight.w400),
                      ),
                    );
                  }).toList(),
                );
              } else {
                return const Center(
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(
                        color: CustomColor.themeRed,
                        strokeWidth: 2,
                      ),
                    ),
                  ),
                );
              }
            },
          ),
        ),
      ],
    );
  }
}
