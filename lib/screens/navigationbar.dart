import 'package:flutter/material.dart';

class navigation_bar extends StatelessWidget {
  const navigation_bar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        bottomNavigationBar: NavigationBar(
          height: 80,
          elevation: 0,
          selectedIndex: 0,

          destinations: [
          NavigationDestination(icon: Icon(Icons.home), label: 'StreakPage'),
          NavigationDestination(icon: Icon(Icons.checklist), label: 'TaskPage'),
          NavigationDestination(icon: Icon(Icons.youtube_searched_for_outlined), label: 'WatchPage'),
          NavigationDestination(icon: Icon(Icons.person), label: 'Profile')
        ],)
    );
  }
}
