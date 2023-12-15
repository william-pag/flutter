import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:pag_flutter/bloc/department/department_bloc.dart';
import 'package:pag_flutter/components/loading.dart';
import 'package:pag_flutter/config/enum.dart';
import 'package:pag_flutter/constants/icons.dart';
import 'package:pag_flutter/model/department.dart';
import 'package:pag_flutter/screens/login/index.dart';

class DropdownSelectDepartment extends StatelessWidget {
  final void Function(int strategyId, int departmentId) onChangeValue;
  const DropdownSelectDepartment({
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
      margin: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: BlocConsumer<DepartmentBloc, DepartmentState>(
        listener: (context, state) {
          if (state.status == Progress.error) {
            Navigator.of(context).pushNamed(LoginScreen.routeName);
          }
        },
        builder: (BuildContext context, DepartmentState state) {
          if (state.status == Progress.loaded) {
            return DropdownButton<Department>(
              underline: Container(),
              isExpanded: true, // Fill the width of the container
              value: state.selectedDepartment,
              onChanged: (Department? newValue) {
                if (newValue != null) {
                  context
                      .read<DepartmentBloc>()
                      .add(SelectDepartment(selectedDepartment: newValue));
                  onChangeValue(state.strategyId, newValue.id);
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
              items: state.departments.map((Department department) {
                return DropdownMenuItem<Department>(
                  key: Key(department.id.toString()),
                  value: department,
                  child: Text(
                    department.name,
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
