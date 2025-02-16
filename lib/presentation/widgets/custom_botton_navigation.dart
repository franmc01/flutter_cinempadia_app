import 'package:flutter/material.dart';

class CustomBottonNavigation extends StatelessWidget {
  const CustomBottonNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      elevation: 0,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home_max_outlined), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.category_outlined), label: 'Categories'),
        BottomNavigationBarItem(icon: Icon(Icons.favorite_border_rounded), label: 'Favorites'),
      ],
    );
  }
}