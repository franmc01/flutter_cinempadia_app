import 'package:app/presentation/widgets/custom_botton_navigation.dart';
import 'package:flutter/material.dart';

class AppScreen extends StatelessWidget {
  static const name = 'app-screen';
  final Widget childView;

  const AppScreen({super.key, required this.childView});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: childView,
      bottomNavigationBar: CustomBottonNavigation(),
    );
  }
}
