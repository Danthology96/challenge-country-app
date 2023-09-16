import 'package:country_app/config/theme/app_theme.dart';
import 'package:country_app/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Country App',
        debugShowCheckedModeBanner: false,
        theme: AppTheme().getTheme(),
        home: const HomeScreen());
  }
}
