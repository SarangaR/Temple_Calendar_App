library kovil_app.global;


import 'package:flutter/services.dart';
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

Map<int, String> dayLookup = {
  1: "Monday",
  2: "Tuesday",
  3: "Wendesday",
  4: "Thursday",
  5: "Friday",
  6: "Saturday",
  7: "Sunday"
};
Map<String, dynamic> jsons = {};
bool autoJsonLoad = true;
bool invalidTimeZone = false;

DateTime dt = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
String dateStr = "${dt.day} ${monthLookup[dt.month]} ${dt.year}";
int year = DateTime.now().year;
int month = DateTime.now().month;
int day = DateTime.now().day;
String dayStr = dayLookup[DateTime.now().weekday.toInt()].toString();
String correctedDay = day < 10 ? "0$day" : day.toString();

String timeZone = "Eastern";
bool autoTimezoneSync = true;
Map<String, dynamic> calendarInfo = {};

String? appDir = "";

SharedPreferences? sharedPreferences;

const Map<int, String> monthLookup = {
  1: "Jan",
  2: "Feb",
  3: "Mar",
  4: "Apr",
  5: "May",
  6: "Jun",
  7: "Jul",
  8: "Aug",
  9: "Sept",
  10: "Oct",
  11: "Nov",
  12: "Dec"
};

void getLocalTimezone() {
  DateTime now = DateTime.now();
  String localTimezone = now.timeZoneName;
  if (localTimezone == "IST") {
    timeZone = "Srirangam";
  }
  else if (localTimezone == "EDT") {
    timeZone = "Eastern";
  }
  else if (localTimezone == "CST") {
    timeZone = "Central";
  }
  else if (localTimezone == "PST") {
    timeZone = "Pacific";
  }
  else if (localTimezone == "MST") {
    timeZone = "Mountain";
  }
  else {
    timeZone = "Eastern";
    autoTimezoneSync = false;
    invalidTimeZone = true;
  }
}

void updateDate() {
  year = DateTime.now().year;
  month = DateTime.now().month;
  day = DateTime.now().day;
  correctedDay = day < 10 ? "0$day" : day.toString();
  dt = DateTime(year, month, day);
  dateStr = "${dt.day} ${monthLookup[dt.month]} ${dt.year}";
  dayStr = dayLookup[dt.weekday.toInt()].toString();
}

void manualDateChange(DateTime currDate) {
  year = currDate.year;
  month = currDate.month;
  day = currDate.day;
  correctedDay = day < 10 ? "0$day" : day.toString();
  dateStr = "${currDate.day} ${monthLookup[currDate.month]} ${currDate.year}";
  dayStr = dayLookup[currDate.weekday.toInt()].toString();
}

Future<void> getSharedPreferences() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  sharedPreferences = prefs;
}

Future<void> readJson() async {
    getLocalTimezone();
    String path1 = "assets/$year-${year+1}.Srirangam.json";
    String path2 = "assets/$year-${year+1}.Eastern Time.json";
    String path3 = "assets/$year-${year+1}.Central Time.json";
    String path4 = "assets/$year-${year+1}.Pacific Time.json";
    String path5 = "assets/$year-${year+1}.Mountain Time.json";

    final String response1 = await rootBundle.loadString(path1);
    final String response2 = await rootBundle.loadString(path2);
    final String response3 = await rootBundle.loadString(path3);
    final String response4 = await rootBundle.loadString(path4);
    final String response5 = await rootBundle.loadString(path5);
    
    final String? tzresp = sharedPreferences?.getString("setTimezone");

    final data1 = await json.decode(response1);
    final data2 = await json.decode(response2);
    final data3 = await json.decode(response3);
    final data4 = await json.decode(response4);
    final data5 = await json.decode(response5);

    if (tzresp != null) {
      autoTimezoneSync = false;
      timeZone = tzresp.toString();
    }
    else {
      autoTimezoneSync = true;
      autoJsonLoad = true;
    }

    jsons = {
      "Srirangam": data1,
      "Eastern": data2,
      "Central": data3,
      "Pacific": data4,
      "Mountain": data5
    };

    if (autoJsonLoad) {
      if (jsons[timeZone] != null) {
        calendarInfo = jsons[timeZone];
      }
    }
}

void writeTz(String tz) {
  sharedPreferences?.setString("setTimezone", tz);
}

void reloadJson() {
  calendarInfo = jsons[timeZone];
}