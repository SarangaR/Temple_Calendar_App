import 'package:flutter/material.dart';
import 'package:kovil_app/global_vars.dart' as global;

class CustomTable extends StatefulWidget {
  const CustomTable({Key? key}) : super(key: key);

  @override
  State<CustomTable> createState() => _CustomTableState();
}

class _CustomTableState extends State<CustomTable> {
  @override
  Widget build(BuildContext context) {
    var data = Padding(
      padding: const EdgeInsets.only(top: 10.0, right: 40.0, left: 40.0),
      child: Table(
        border: TableBorder.all(),
        children: [
          TableRow(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Sauramana Maasam"),
                  Text(
                    global.calendarInfo[global.year.toString()][global.month.toString()][global.correctedDay]["sauramana"],
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                      ),
                      children: [
                        TextSpan(
                          text: "${global.calendarInfo[global.year.toString()][global.month.toString()][global.correctedDay]["samvatsaram"]}\n",
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const TextSpan(
                          text: "nama samvatsaram",
                        ),
                      ],
                    ),
                  ),
                  Text(
                    global.calendarInfo[global.year.toString()][global.month.toString()][global.correctedDay]["punyakaalam"],
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                          global.calendarInfo[global.year.toString()][global.month.toString()][global.correctedDay]["ritu"],
                          style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 8.0),
                        child: Text("ritu"),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          TableRow(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Chandramana Maasam"),
                  Text(
                    global.calendarInfo[global.year.toString()][global.month.toString()][global.correctedDay]["chandramana"],
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Sankalpa Tithi"),
                  Text(
                    global.calendarInfo[global.year.toString()][global.month.toString()][global.correctedDay]["sankalpa_tithi"],
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text("ShrAddha Tithi"),
                  Text(
                    global.calendarInfo[global.year.toString()][global.month.toString()][global.correctedDay]["aparanha_tithi"],
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ]
          ),
          TableRow(
            children: [
              Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Kaalam"),
                    RichText(
                      text: TextSpan(
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                        ),
                        children: [
                          const TextSpan(
                            text: "Rahu: ",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text: global.calendarInfo[global.year.toString()][global.month.toString()][global.correctedDay]["rahukaalam"],
                          ),
                        ],
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                        ),
                        children: [
                          const TextSpan(
                            text: "Yama: ",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text: global.calendarInfo[global.year.toString()][global.month.toString()][global.correctedDay]["yamagandam"],
                          ),
                        ],
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                        ),
                        children: [
                          const TextSpan(
                            text: "Guli: ",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text: global.calendarInfo[global.year.toString()][global.month.toString()][global.correctedDay]["gulikakaalam"],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Sankalpa Nakshatram"),
                    Text(
                      global.calendarInfo[global.year.toString()][global.month.toString()][global.correctedDay]["sankalpa_nakshatram"],
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text("Acharana Nakshatram"),
                    Text(
                      global.calendarInfo[global.year.toString()][global.month.toString()][global.correctedDay]["acharana_nakshatram"],
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
            ],
          ),
        ],
      ),
    );

    return data;
  }
}