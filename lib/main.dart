import 'package:flutter/material.dart';
import 'package:kovil_app/home_page.dart';
import 'package:kovil_app/about.dart';
import 'package:kovil_app/settings.dart';

void main() {
  runApp(const MainApp());
}

DateTime now = DateTime.now();
DateTime date = DateTime(now.year, now.month, now.day);

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
