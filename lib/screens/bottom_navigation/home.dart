import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pag_flutter/bloc/bloc.dart';
import 'package:pag_flutter/bloc/home/overall_progress/overall_progress_bloc.dart';
import 'package:pag_flutter/components/dropdown_select/departments.dart';
import 'package:pag_flutter/components/dropdown_select/strategies.dart';

class Home extends StatelessWidget {
  const Home({super.key});

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
          create: (BuildContext _) =>
              OverallProgressBloc()..add(InitialOverallEvent()),
        ),
      ],
      child: const _Home(),
    );
  }
}

class _Home extends StatelessWidget {
  const _Home();

  @override
  Widget build(BuildContext context) {
    String text = "Text";
    return ListView(
      addAutomaticKeepAlives: true,
      shrinkWrap: true,
      children: [
        DropdownSelectStrategies(
          onChangeValue: (int strategyId, int departmentId) {
            context.read<DepartmentBloc>().add(
                  FilterDepartments(strategyId: strategyId),
                );
            context.read<DeadlineBloc>().add(
                  FilterDeadline(
                      strategyId: strategyId, departmentId: departmentId),
                );
          },
        ),
        DropdownSelectDepartment(
          onChangeValue: (int strategyId, int departmentId) {
            context.read<DeadlineBloc>().add(
                  FilterDeadline(
                    strategyId: strategyId,
                    departmentId: departmentId,
                  ),
                );
          },
        ),
        Container(
          margin: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
          height: 600,
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: BlocConsumer<OverallProgressBloc,
                          OverallProgressState>(
                        listener: (BuildContext _, OverallProgressState state) {
                          print([74, state]);
                        },
                        builder: (BuildContext _, OverallProgressState state) {
                          return Text(text);
                        },
                      ),
                    ),
                    const SizedBox(width: 10),
                    const Expanded(
                      flex: 1,
                      child: Text("hello"),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              const Expanded(
                flex: 1,
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Text("hello"),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      flex: 1,
                      child: Text("hello"),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
