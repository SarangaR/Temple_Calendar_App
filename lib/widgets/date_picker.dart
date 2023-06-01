import 'package:flutter/material.dart';
import 'package:kovil_app/global_vars.dart' as global;

class DatePicker extends StatefulWidget {
  const DatePicker({Key? key}) : super(key: key);

  @override
  State<DatePicker> createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(global.year, 4, 14),
        lastDate: DateTime(global.year+1, 5, 13));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        global.manualDateChange(selectedDate);
        Navigator.popAndPushNamed(context, "/home");
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: () => _selectDate(context), 
      label: const Text('Calendar'),
    );
  }
}