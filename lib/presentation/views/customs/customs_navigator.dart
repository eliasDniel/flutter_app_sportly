import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomBottomNavigation extends StatelessWidget {
  final int currentIndex;
  final String code;

  const CustomBottomNavigation({super.key, required this.currentIndex, required this.code});

  void onItemTapped(BuildContext context, int index) {
    // context.go('/initial/home/$code/0');
    switch (index) {
      case 0:
        context.go('/initial/home/$code/0');
        break;

      case 1:
        context.go('/initial/home/$code/1');
        break;

      case 2:
        context.go('/initial/home/$code/2');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (value) => onItemTapped(context, value),
        elevation: 0,
        selectedItemColor: colors.primary,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.score), label: 'Scores'),
          BottomNavigationBarItem(icon: Icon(Icons.tv), label: 'Watch'),
        ]);
  }
}
