import 'package:flutter/material.dart';
import 'package:pag_flutter/constants/colors.dart';
import 'items/app_bar.dart';
import 'screens/bottom_navigation/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  // Widgets for each tab/screen
  final List<Widget> _widgetOptions = <Widget>[
    const Home(),
    const Text('Search Page'),
    const Text('Profile Page'),
    const Text('Profile1 Page'),
    const Text('Profile2 Page'),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColor.themeRed,
        title: const AppBarCustom(
          name: 'Alta Jackson',
          avatar:
              'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/403.jpg',
        ),
        titleSpacing: 0,
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.grey[300],
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: const Icon(
                Icons.home,
              ),
              label: "Home",
              activeIcon: Container(
                width: 70,
                height: 35,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.deepPurple[100]),
                child: const Icon(
                  Icons.home,
                ),
              )),
          BottomNavigationBarItem(
              icon: const Icon(Icons.watch_later_rounded),
              label: "Deadline",
              activeIcon: Container(
                width: 70,
                height: 35,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.deepPurple[100]),
                child: const Icon(
                  Icons.watch_later_rounded,
                ),
              )),
          BottomNavigationBarItem(
              icon: const Icon(Icons.calendar_month),
              label: "Reminder",
              activeIcon: Container(
                width: 70,
                height: 35,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.deepPurple[100]),
                child: const Icon(
                  Icons.calendar_month,
                ),
              )),
          BottomNavigationBarItem(
              icon: const Icon(Icons.person),
              label: "User",
              activeIcon: Container(
                width: 70,
                height: 35,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.deepPurple[100]),
                child: const Icon(
                  Icons.person,
                ),
              )),
          BottomNavigationBarItem(
              icon: const Icon(Icons.notifications),
              label: "Notification",
              activeIcon: Container(
                width: 70,
                height: 35,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.deepPurple[100]),
                child: const Icon(
                  Icons.notifications,
                ),
              )),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.indigo[900], // Color for selected item
        onTap: _onItemTapped,
        showSelectedLabels: false,
        showUnselectedLabels: false,
      ),
    );
  }
}
