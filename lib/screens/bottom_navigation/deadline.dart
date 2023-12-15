import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:pag_flutter/bloc/bloc.dart';
import 'package:pag_flutter/components/components.dart';
import 'package:pag_flutter/config/config.dart';
import 'package:pag_flutter/model/model.dart';
import 'package:pag_flutter/screens/screens.dart';

class Deadline extends StatelessWidget {
  const Deadline({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (BuildContext _) => StrategyBloc()..add(StrategyLoading())),
        BlocProvider(
            create: (BuildContext _) =>
                DepartmentBloc()..add(DepartmentLoading())),
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
        DropdownSelectStrategies(
          onChangeValue: (int strategyId, int departmentId) {
            context
                .read<DepartmentBloc>()
                .add(FilterDepartments(strategyId: strategyId));
            context.read<DeadlineBloc>().add(FilterDeadline(
                strategyId: strategyId, departmentId: departmentId));
          },
        ),
        DropdownSelectDepartment(
          onChangeValue: (int strategyId, int departmentId) {
            context.read<DeadlineBloc>().add(FilterDeadline(
                  strategyId: strategyId,
                  departmentId: departmentId,
                ));
          },
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
              return const Loading();
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
