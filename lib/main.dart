import 'package:flutter/material.dart';
import 'package:queritel_practical/constants/colors.dart';
import 'package:queritel_practical/locator.dart';
import 'package:queritel_practical/screens/home.dart';

void main() {
  setupLocator();
  runApp(const QueritelPractical());
}

class QueritelPractical extends StatelessWidget {
  const QueritelPractical({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: CustomColors.primaryColor,
        scaffoldBackgroundColor: CustomColors.backgroundColor,
        appBarTheme: const AppBarTheme(
          backgroundColor: CustomColors.primaryColor,
        ),
      ),
      home: const HomeScreen(),
    );
  }
}
