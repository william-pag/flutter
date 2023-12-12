import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:pag_flutter/bloc/bloc.dart';
import 'package:pag_flutter/config/config.dart';
import 'package:pag_flutter/constants/constants.dart';
import 'package:pag_flutter/model/model.dart';
import 'package:pag_flutter/screens/screens.dart';

class Deadline extends StatelessWidget {
  const Deadline({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext _) => StrategyBloc()..add(StrategyLoading()),
        ),
        BlocProvider(
          create: (BuildContext _) =>
              DepartmentBloc()..add(DepartmentLoading()),
        ),
        BlocProvider(
          create: (BuildContext _) => DeadlineBloc()..add(LoadDeadline()),
        ),
      ],
      child: const _Deadline(),
    );
  }
}

class _Deadline extends StatelessWidget {
  const _Deadline();

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
          child: BlocConsumer<StrategyBloc, StrategyState>(
            listener: (context, state) {
              if (state.status == Progress.error) {
                Navigator.of(context).pushNamed(LoginScreen.routeName);
              }
            },
            builder: (BuildContext context, StrategyState state) {
              if (state.status == Progress.loaded) {
                return DropdownButton<Strategy>(
                  underline: Container(),
                  isExpanded: true, // Fill the width of the container
                  value: state.selectedStategy,
                  onChanged: (Strategy? newValue) {
                    if (newValue != null) {
                      context
                          .read<StrategyBloc>()
                          .add(SelectStrategy(selectedStategy: newValue));
                      context
                          .read<DepartmentBloc>()
                          .add(FilterDepartments(strategy: newValue));
                      context
                          .read<DeadlineBloc>()
                          .add(FilterDeadline(strategyId: newValue.id));
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
                    child: const Icon(
                        IconData(0xf13d, fontFamily: 'MaterialIcons')),
                  ),
                  items: state.strategies.map((Strategy strategy) {
                    return DropdownMenuItem<Strategy>(
                      key: Key(strategy.id.toString()),
                      value: strategy,
                      child: Text(
                        strategy.name,
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
        Container(
          width: double.infinity, // Full width of the screen
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey), // Optional border
            borderRadius: BorderRadius.circular(5), // Optional border radius
          ),
          margin: const EdgeInsets.all(10),
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
                      context.read<DeadlineBloc>().add(FilterDeadline(
                            strategyId: state.strategyId,
                            departmentId: newValue.id,
                          ));
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
                    child: const Icon(
                        IconData(0xf13d, fontFamily: 'MaterialIcons')),
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
        Expanded(
          flex: 1,
          child: BlocConsumer<DeadlineBloc, DeadlineState>(
            listener: (context, state) {
              if (state.status == Progress.error) {
                Navigator.of(context).pushNamed(LoginScreen.routeName);
              }
            },
            builder: (BuildContext context, DeadlineState state) {
              if (state.status == Progress.loaded) {
                return ListView.builder(
                  itemCount: state.deadlines.length,
                  itemBuilder: (context, index) {
                    return BoxDeadline(deadline: state.deadlines[index]);
                  },
                  addAutomaticKeepAlives: false,
                  addRepaintBoundaries: false,
                );
              }
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
            },
          ),
        )
      ],
    );
  }
}

class BoxDeadline extends StatelessWidget {
  final ResponseDeadline deadline;
  const BoxDeadline({
    Key? key,
    required this.deadline,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(color: Colors.grey),
          left: BorderSide(color: Colors.grey),
          right: BorderSide(color: Colors.grey),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            deadline.department,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.blue[900],
            ),
          ),
          Text(
            deadline.subDepartment,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.bold,
              color: Colors.teal[700],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                deadline.deadline,
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: Colors.red[800],
                ),
              ),
              Text(
                deadline.dateDeadline,
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: Colors.red[800],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
