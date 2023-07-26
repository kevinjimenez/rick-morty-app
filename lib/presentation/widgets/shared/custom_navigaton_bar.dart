import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomNavigatonBar extends StatelessWidget {
  final int currentIndex;

  const CustomNavigatonBar({super.key, required this.currentIndex});

  void onItemTapped(BuildContext context, int index) {
    // context.go('/home/$index');
    switch (index) {
      case 0:
        context.go('/home/0');
        break;
      case 1:
        context.go('/home/1');
        break;
      case 2:
        context.go('/home/2');
        break;
      default:
        context.go('/home/0');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        elevation: 0,
        currentIndex: currentIndex,
        onTap: (value) {
          onItemTapped(context, value);
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.location_searching_outlined,
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.tv,
              ),
              label: ''),
        ]);
  }
}
