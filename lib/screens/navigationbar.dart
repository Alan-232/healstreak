import 'package:flutter/material.dart';

class navigation_bar extends StatefulWidget {
  const navigation_bar({super.key});

  @override
  State<navigation_bar> createState() => _navigation_barState();
}

class _navigation_barState extends State<navigation_bar> {
  int MyIndex =0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        bottomNavigationBar: NavigationBar(

          height: 80,
          elevation: 0,
          selectedIndex: 0,

          destinations: [
          NavigationDestination(icon: Icon(Icons.home), label: 'StreakPage'),
          NavigationDestination(icon: Icon(Icons.checklist), label: 'task_screen'),
          NavigationDestination(icon: Icon(Icons.youtube_searched_for_outlined), label: 'WatchPage'),
          NavigationDestination(icon: Icon(Icons.person), label: 'Profile')
        ],)
    );
  }
}
