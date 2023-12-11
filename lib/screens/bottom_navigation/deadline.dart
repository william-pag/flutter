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
          create: (BuildContext _) => DeadlineBloc()..add(LoadingDeadline()),
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
                      child: Text(strategy.name),
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
                  items: (state is DepartmentFilter
                          ? state.filteredDepartments
                          : state.departments)
                      .map((Department department) {
                    return DropdownMenuItem<Department>(
                      key: Key(department.id.toString()),
                      value: department,
                      child: Text(department.name),
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
        // Expanded(
        //   flex: 1,
        //   child: ListView.builder(
        //     itemCount: items.length,
        //     itemBuilder: (context, index) {
        //       return ListTile(
        //         title: Text(items[index]),
        //       );
        //     },
        //   ),
        // )
      ],
    );
  }
}
