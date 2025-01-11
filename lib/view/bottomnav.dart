import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quadbtech_test/provider/homescreen_provider.dart';
import 'package:quadbtech_test/view/homescreen.dart';
import 'package:quadbtech_test/view/searchscreen.dart';

class BottomNav extends StatelessWidget {
  BottomNav({super.key});

  final List<Widget> _screens = [
    const Homescreen(),
     Searchscreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Consumer<HomescreenProvider>(builder: (context, value, child) {
      return Scaffold(
        body: _screens[value.currentindex],

        // Display the selected screen
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.black,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
          currentIndex: value.currentindex,
          unselectedFontSize: 14,
          type: BottomNavigationBarType.fixed,
          onTap: (index) {
            value.onPageChange(index);
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
            ),
          ],
        ),
      );
    });
  }
}
