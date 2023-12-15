import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:pag_flutter/bloc/strategy/strategy_bloc.dart';
import 'package:pag_flutter/components/loading.dart';
import 'package:pag_flutter/config/enum.dart';
import 'package:pag_flutter/constants/icons.dart';
import 'package:pag_flutter/model/strategy.dart';
import 'package:pag_flutter/screens/login/index.dart';

class DropdownSelectStrategies extends StatelessWidget {
  final void Function(int strategyId, int departmentId) onChangeValue;
  const DropdownSelectStrategies({
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
                  onChangeValue(newValue.id, 0);
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
            return const Loading();
          }
        },
      ),
    );
  }
}
