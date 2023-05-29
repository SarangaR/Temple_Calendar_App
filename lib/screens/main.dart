import 'package:flutter/material.dart';
import 'package:kovil_app/screens/home_page.dart';

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
