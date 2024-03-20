import 'package:flutter/material.dart';
import 'package:hostar_clone_1/colors/colors.dart';

import 'package:hostar_clone_1/home.dart';
import 'package:hostar_clone_1/news&hot.dart';
import 'package:hostar_clone_1/search/search.dart';

class BottomNaavigation extends StatefulWidget {
  const BottomNaavigation({super.key});

  @override
  State<BottomNaavigation> createState() => _BottomNaavigationState();
}

int selectedindex = 0;

final pages = [
  Home(),
  SearchScreen(),
  Newsandhot(),

];

class _BottomNaavigationState extends State<BottomNaavigation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selectedindex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor:const Color.fromARGB(255, 20, 20, 20),
          selectedItemColor: Color.fromARGB(255, 255, 255, 255),
          unselectedItemColor: Color.fromARGB(255, 19, 74, 103),
          showSelectedLabels: true,
          showUnselectedLabels: true,
          currentIndex: selectedindex,
          onTap: (value) {
            setState(() {
              selectedindex = value;
            });
          },
          items: const [
            BottomNavigationBarItem(
              backgroundColor: Color.fromARGB(206, 0, 15, 28),
                icon: Icon(
                  Icons.home,
                ),
                label: 'Home',),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
            BottomNavigationBarItem(icon: Icon(Icons.local_fire_department), label: 'Hot&News'),
          
          ]),
    );
  }
}
