import 'package:flutter/material.dart';
import 'package:meditation_app/pages/favorites.dart';
import 'package:meditation_app/pages/home.dart';
import 'package:meditation_app/pages/profile.dart';

class NavBarPage extends StatefulWidget {
  NavBarPage({Key? key}) : super(key: key);

  @override
  State<NavBarPage> createState() => _NavBarPageState();
}

class _NavBarPageState extends State<NavBarPage> {
  int myIndex = 0;
  List<Widget> widgetList = [
    Home(),
    Favorites(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        title: Text(
          'Meditation',
        ),
        // actions: [
        //   Text('username'),
        //   IconButton(icon: Icon(Icons.account_circle), onPressed: () {})
        // ],
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            myIndex = index;
          });
        },
        currentIndex: myIndex,
        elevation: 30,
        unselectedItemColor: Color.fromARGB(255, 145, 144, 144),
        selectedItemColor: Colors.black,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.supervised_user_circle),
            label: 'Profile',
          ),
        ],
      ),
      body: IndexedStack(children: widgetList, index: myIndex),
    );
  }
}
