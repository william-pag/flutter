import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pag_flutter/bloc/strategy/strategy_bloc.dart';
import 'package:pag_flutter/config/config.dart';
import 'package:pag_flutter/constants/constants.dart';
import 'package:pag_flutter/model/model.dart';

class Deadline extends StatelessWidget {
  Deadline({super.key});

  final List<String> selectDepartments = [
    'Select Department',
    'Select Department2',
    'Select Department3'
  ]; // List of dropdown items
  final List<String> items = List.generate(
      1000, (index) => 'Option Option Option Option Option Option $index');
  final String selectedDepartment =
      'Select Department'; // Default selected value
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => StrategyBloc()..add(StrategyLoading()),
      child: _Deadline(
          selectedDepartment: selectedDepartment,
          selectDepartments: selectDepartments,
          items: items),
    );
  }
}

class _Deadline extends StatelessWidget {
  const _Deadline({
    required this.selectedDepartment,
    required this.selectDepartments,
    required this.items,
  });

  final String selectedDepartment;
  final List<String> selectDepartments;
  final List<String> items;

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
              print([59, state]);
            },
            builder: (BuildContext context, StrategyState state) {
              if (state.status == Progress.loaded) {
                return DropdownButton<Strategy>(
                  underline: Container(),
                  isExpanded: true, // Fill the width of the container
                  value: state.selectedStategy,
                  onChanged: (Strategy? newValue) {
                    print([66, state.selectedStategy, newValue]);
                    if (newValue != null) {
                      context
                          .read<StrategyBloc>()
                          .add(SelectStrategy(selectedStategy: newValue));
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
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(strategy.name),
                          Text(strategy.id.toString()),
                        ],
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
        // Container(
        //   width: double.infinity, // Full width of the screen
        //   decoration: BoxDecoration(
        //     border: Border.all(color: Colors.grey), // Optional border
        //     borderRadius: BorderRadius.circular(5), // Optional border radius
        //   ),
        //   margin: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
        //   padding: const EdgeInsets.only(left: 10, right: 10),
        //   child: DropdownButton<String>(
        //     underline: Container(),
        //     isExpanded: true, // Fill the width of the container
        //     value: selectedDepartment,
        //     onChanged: (String? newValue) {
        //       if (newValue != null) {}
        //     },
        //     icon: Container(
        //       decoration: const BoxDecoration(
        //         border: Border(
        //           left: BorderSide(
        //             color: Colors.grey, // Border color
        //             width: 2, // Border width
        //           ),
        //         ), // Optional border
        //       ),
        //       padding: const EdgeInsets.only(left: 5),
        //       child: const Icon(IconData(0xf13d, fontFamily: 'MaterialIcons')),
        //     ),
        //     items: selectDepartments.map((String value) {
        //       return DropdownMenuItem<String>(
        //         value: value,
        //         child: Text(value),
        //       );
        //     }).toList(),
        //   ),
        // ),
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
