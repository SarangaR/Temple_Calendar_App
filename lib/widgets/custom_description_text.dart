import 'package:flutter/material.dart';
import 'package:kovil_app/global_vars.dart' as global;  

class CustomDescriptionText extends StatefulWidget {
  const CustomDescriptionText({Key? key}) : super(key: key);

  @override
  State<CustomDescriptionText> createState() => _CustomDescriptionTextState();
}

class _CustomDescriptionTextState extends State<CustomDescriptionText> {
  String getEventString() {
    List events = global.calendarInfo[global.year.toString()][global.month.toString()][global.correctedDay]["events"];
    return events.toString().substring(1, events.toString().length - 1);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Text(
                getEventString(),
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.red,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: Text(
                "${global.calendarInfo[global.year.toString()][global.month.toString()][global.correctedDay]["sankalpam"]}",
                textAlign: TextAlign.center,
              )
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: Visibility(
                visible: global.invalidTimeZone,
                child: const Text(
                  "Invalid TimeZone, defaulting to Eastern",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      )
    );
  }
}