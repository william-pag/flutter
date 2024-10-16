import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pag_flutter/bloc/me/me_bloc.dart';
import 'package:pag_flutter/constants/colors.dart';
import 'package:pag_flutter/items/app_bar.dart';
import 'package:pag_flutter/items/box_user_info.dart';
import 'package:pag_flutter/screens/bottom_navigation/deadline.dart';
import 'package:pag_flutter/screens/bottom_navigation/home.dart';
import 'package:pag_flutter/screens/bottom_navigation/list_users.dart';
import 'package:pag_flutter/screens/bottom_navigation/notification.dart';
import 'package:pag_flutter/screens/bottom_navigation/reminder.dart';

class BottomMenu extends StatelessWidget {
  static const String routeName = 'bottom_menu';
  static Route route() {
    return MaterialPageRoute(
      builder: (BuildContext context) => const BottomMenu(),
      settings: const RouteSettings(name: routeName),
    );
  }

  const BottomMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MeBloc()..add(LoadMe()),
      child: const MenuPage(),
    );
  }
}

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  int _selectedIndex = 0;

  // Widgets for each tab/screen
  final List<Widget> _widgetOptions = <Widget>[
    const Home(),
    const Deadline(),
    const Reminder(),
    const ListOfUsers(),
    const Notifications(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  BottomNavigationBarItem _renderIcon(IconData iconMenu) {
    return BottomNavigationBarItem(
        icon: Icon(
          iconMenu,
        ),
        label: "Home",
        activeIcon: Container(
          width: 70,
          height: 35,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.deepPurple[100]),
          child: Icon(
            iconMenu,
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColor.themeRed,
        title: const AppBarCustom(),
        titleSpacing: 0,
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.grey[300],
        items: <BottomNavigationBarItem>[
          _renderIcon(Icons.home),
          _renderIcon(Icons.watch_later_rounded),
          _renderIcon(Icons.calendar_month),
          _renderIcon(Icons.person),
          _renderIcon(Icons.notifications),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.indigo[900], // Color for selected item
        onTap: _onItemTapped,
        showSelectedLabels: false,
        showUnselectedLabels: false,
      ),
      drawerEnableOpenDragGesture: true,
      drawer: Container(
        color: Colors.white,
        width: MediaQuery.of(context).size.width * 0.75,
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.3,
              color: Colors.deepPurple,
              child: const BoxUserInfo(),
            )
          ],
        ),
      ),
    );
  }
}
