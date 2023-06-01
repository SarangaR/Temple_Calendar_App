import 'package:flutter/material.dart';
import 'package:kovil_app/global_vars.dart' as global;

class Sun extends StatefulWidget {
  const Sun({Key? key}) : super(key: key);

  @override
  State<Sun> createState() => _SunState();
}

class _SunState extends State<Sun> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(40.0),
            child: Text(
              "Sunrise - ${global.calendarInfo[global.year.toString()][global.month.toString()][global.correctedDay]["sunrise"]}",
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
          ),
        ),
        Expanded(
          child: Text(
            global.dayStr,
            style: const TextStyle(
              fontSize: 40,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(40.0),
            child: Text(
              "Sunset - ${global.calendarInfo[global.year.toString()][global.month.toString()][global.correctedDay]["sunset"]}",
              style: const TextStyle(
                fontSize: 20,
              ),
              textAlign: TextAlign.right,
            ),
          ),
        ),
      ],
    );
  }
}