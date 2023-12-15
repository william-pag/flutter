import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pag_flutter/bloc/users/users_bloc.dart';
import 'package:pag_flutter/components/loading.dart';
import 'package:pag_flutter/config/enum.dart';
import 'package:pag_flutter/constants/icons.dart';
import 'package:pag_flutter/model/user.dart';
import 'package:pag_flutter/screens/login/index.dart';

class DropdownSelectAllUsers extends StatelessWidget {
  final void Function(UserModel) onChangeValue;
  const DropdownSelectAllUsers({
    Key? key,
    required this.onChangeValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, // Full width of the screen
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey), // Optional border
        borderRadius: BorderRadius.circular(5), // Optional border radius
      ),
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: BlocConsumer<UsersBloc, UsersState>(
        listener: (BuildContext context, UsersState state) {
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
                  onChangeValue(newValue);
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
            return const Loading();
          }
        },
      ),
    );
  }
}
