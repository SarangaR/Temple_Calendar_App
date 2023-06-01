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
            Text(
              getEventString(),
              style: const TextStyle(
                fontSize: 20,
                color: Colors.red,
              ),
            ),
            const SizedBox(
              height: 30
            ),
            SizedBox(
              width: 1000,
              child: Text(
                global.calendarInfo[global.year.toString()][global.month.toString()][global.correctedDay]["sankalpam"],
              ),
            )
          ],
        ),
      )
    );
  }
}