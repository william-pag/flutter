import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pag_flutter/bloc/bloc.dart';
import 'package:pag_flutter/bloc/home/overall_progress/overall_progress_bloc.dart';
import 'package:pag_flutter/components/components.dart';
import 'package:pag_flutter/config/enum.dart';

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
        BlocConsumer<OverallProgressBloc, OverallProgressState>(
          listener: (BuildContext _, OverallProgressState state) {
            // print([74, state]);
          },
          builder: (BuildContext _, OverallProgressState state) {
            if (state.progress == Progress.loaded) {
              return Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(
                      left: 10,
                      right: 10,
                      bottom: 10,
                    ),
                    height: 600,
                    child: Column(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text(
                                      'Overall Progress',
                                      style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    AspectRatio(
                                      aspectRatio: 1.0,
                                      child: Stack(
                                        children: [
                                          PieChart(
                                            PieChartData(
                                              sections: state.list[0],
                                              centerSpaceRadius: 40.0,
                                            ),
                                          ),
                                          Center(
                                            child: Text(
                                              state.list[0][0].title,
                                              style: const TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                flex: 1,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text(
                                      'Overall Progress',
                                      style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    AspectRatio(
                                      aspectRatio: 1.0,
                                      child: Stack(
                                        children: [
                                          PieChart(
                                            PieChartData(
                                              sections: state.list[1],
                                              centerSpaceRadius: 40.0,
                                            ),
                                          ),
                                          Center(
                                            child: Text(
                                              state.list[1][0].title,
                                              style: const TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),
                        Expanded(
                          flex: 1,
                          child: Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text(
                                      'Overall Progress',
                                      style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    AspectRatio(
                                      aspectRatio: 1.0,
                                      child: Stack(
                                        children: [
                                          PieChart(
                                            PieChartData(
                                              sections: state.list[2],
                                              centerSpaceRadius: 40.0,
                                            ),
                                          ),
                                          Center(
                                            child: Text(
                                              state.list[2][0].title,
                                              style: const TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                flex: 1,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text(
                                      'Overall Progress',
                                      style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    AspectRatio(
                                      aspectRatio: 1.0,
                                      child: Stack(
                                        children: [
                                          PieChart(
                                            PieChartData(
                                              sections: state.list[3],
                                              centerSpaceRadius: 40.0,
                                            ),
                                          ),
                                          Center(
                                            child: Text(
                                              state.list[3][0].title,
                                              style: const TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      left: 10,
                      right: 10,
                      bottom: 10,
                    ),
                    height: 300,
                    child: ListView.builder(
                        itemCount: state.listPE.length,
                        itemBuilder: (BuildContext _, int index) {
                          final pe = state.listPE[index];

                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 30,
                                      height: 30,
                                      child: Image.network(pe.user.image),
                                    ),
                                    const SizedBox(width: 10),
                                    Text(
                                      pe.user.name,
                                      style: const TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ],
                                ),
                                (pe.isComplete || pe.completedPercentage > 50)
                                    ? FilledButton(
                                        onPressed: () {},
                                        child: const Text(
                                          'Finalize',
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            decorationColor: Colors.white,
                                          ),
                                        ),
                                      )
                                    : Text(
                                        "${pe.completePerformance}/${pe.totalPerformance} - ${pe.completedPercentage}% completed",
                                        style: const TextStyle(
                                          decoration: TextDecoration.underline,
                                        ),
                                      ),
                              ],
                            ),
                          );
                        }),
                  )
                ],
              );
            }

            return const Loading();
          },
        ),
      ],
    );
  }
}
