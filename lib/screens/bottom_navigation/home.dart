import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return const HomePage();
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState  extends State<HomePage> {
  final List<String> selectStrategies = ['Select Strategy', 'Select Strategy2', 'Select Strategy3']; // List of dropdown items
  final List<String> selectDepartments = ['Select Department', 'Select Department2', 'Select Department3']; // List of dropdown items
  final List<String> items = List.generate(1000, (index) => 'Option Option Option Option Option Option $index');
  String selectedStrategy = 'Select Strategy'; // Default selected value
  String selectedDepartment = 'Select Department'; // Default selected value
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
          child: DropdownButton<String>(
            underline: Container(),
            isExpanded: true, // Fill the width of the container
            value: selectedStrategy,
            onChanged: (String? newValue) {
              if (newValue != null) {
                setState(() {
                  selectedStrategy = newValue;
                });
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
              child: const Icon(IconData(0xf13d, fontFamily: 'MaterialIcons')),
            ),
            items: selectStrategies.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ),
        Container(
          width: double.infinity, // Full width of the screen
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey), // Optional border
            borderRadius: BorderRadius.circular(5), // Optional border radius
          ),
          margin: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: DropdownButton<String>(
            underline: Container(),
            isExpanded: true, // Fill the width of the container
            value: selectedDepartment,
            onChanged: (String? newValue) {
              if (newValue != null) {
                setState(() {
                  selectedDepartment = newValue;
                });
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
              child: const Icon(IconData(0xf13d, fontFamily: 'MaterialIcons')),
            ),
            items: selectDepartments.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ),
        Expanded(
          flex: 1,
          child: ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(items[index]),
              );
            },
          ),
        )
      ],
    );
  }

}