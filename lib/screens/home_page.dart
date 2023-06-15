
import 'package:flutter/material.dart';
import 'package:kovil_app/widgets/custom_description_text.dart';
import 'package:kovil_app/widgets/custom_table.dart';
import 'package:kovil_app/widgets/date_picker.dart';
import 'package:kovil_app/widgets/global_appbar.dart';
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
      bottomNavigationBar: ButtonBar(
        alignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
            onPressed: () {
              DateTime currDate = DateTime(global.year, global.month, global.day);
              global.manualDateChange(currDate.subtract(const Duration(days: 1)));
              Navigator.popAndPushNamed(context, '/home');
            },
            child: const Icon(Icons.arrow_back),
          ),
          FloatingActionButton(
            onPressed: () {
              global.updateDate();
              Navigator.popAndPushNamed(context, '/home');
            },
            child: const Icon(Icons.refresh),
          ),
          const DatePicker(),
          FloatingActionButton(
            onPressed: () {
              DateTime currDate = DateTime(global.year, global.month, global.day);
              global.manualDateChange(currDate.add(const Duration(days: 1)));
              Navigator.popAndPushNamed(context, '/home');
            },
            child: const Icon(Icons.arrow_forward)
          ),
        ],
      ),
      body: ListView(
        children: const [
          Text(
            "Srimate Ramanujaya Namaha",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 10,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 8.0),
            child: Text(
              "Sri Ramanuja Mission\nMunitraya Panchangam",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          CustomTable(),
          Padding(
            padding: EdgeInsets.only(bottom: 10.0),
            child: Text(
              "*Ends Next Day",
              textAlign: TextAlign.center,
            ),
          ),
          CustomDescriptionText(),
        ]
      ),
    );
  }
}