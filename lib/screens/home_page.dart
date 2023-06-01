import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:kovil_app/widgets/custom_description_text.dart';
import 'package:kovil_app/widgets/custom_table.dart';
import 'package:kovil_app/widgets/date_picker.dart';
import 'package:kovil_app/widgets/global_appbar.dart';
import 'package:kovil_app/widgets/sun.dart';
import 'package:kovil_app/global_vars.dart' as global;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const GlobalAppBar(),
      body: Column(
        children: [
          const Sun(),
          const CustomTable(),
          const CustomDescriptionText(),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: [
              FloatingActionButton.extended(
                onPressed: () {
                  DateTime currDate = DateTime(global.year, global.month, global.day);
                  global.manualDateChange(currDate.subtract(const Duration(days: 1)));
                  Navigator.popAndPushNamed(context, '/home');
                },
                icon: const Icon(Icons.arrow_back),
                label: const Text('Previous'),
              ),
              const DatePicker(),
              FloatingActionButton.extended(
                onPressed: () {
                  DateTime currDate = DateTime(global.year, global.month, global.day);
                  global.manualDateChange(currDate.add(const Duration(days: 1)));
                  Navigator.popAndPushNamed(context, '/home');
                },
                label: const Row(
                  children: <Widget>[
                    Text("Next"), 
                    Icon(Icons.arrow_forward)
                  ],
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                width: 28,
              ),
              FloatingActionButton.extended(
                onPressed: () {
                  global.updateDate();
                  Navigator.popAndPushNamed(context, '/home');
                },
                icon: const Icon(Icons.refresh),
                label: const Text('Today'),
              )
            ]
          ),
        ]
      ),
    );
  }
}