import 'package:flutter/material.dart';
import 'package:kovil_app/global_vars.dart' as global;

class GlobalAppBar extends StatefulWidget implements PreferredSizeWidget {
  const GlobalAppBar({Key? key}) : super(key: key);

  final double defaultAppBarHeight = 56.0;

  @override
  Size get preferredSize => Size.fromHeight(defaultAppBarHeight);

  @override
  State<GlobalAppBar> createState() => _GlobalAppBarState();
}

class _GlobalAppBarState extends State<GlobalAppBar> {

  void manualTimezoneChange(timezone){
    setState(() {
      global.autoTimezoneSync = false;
      global.timeZone = timezone;
      refresh();
    });
  }

  void refresh() {
    global.reloadJson();
    Navigator.popAndPushNamed(context, '/home');
  }

  @override
  Widget build(BuildContext contenxt) {
    return AppBar(
      title: Row (
        children: [
          Expanded(
            flex: 1,
            child: Column(
              children: [
                const Text(
                  "Sunrise",
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
                Text(
                  "${global.calendarInfo[global.year.toString()][global.month.toString()][global.correctedDay]["sunrise"]}",
                  style: const TextStyle(
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: Column(children: [
                Text(
                  "${global.dayStr}, ${global.dateStr}",
                  style: const TextStyle(fontSize: 14),
                ),
                Text(
                  "${global.timeZone} Time",
                  style: const TextStyle(fontSize: 12),
                )
              ]
            ),
          ),
          Expanded(
            flex: 1,
            child: Column(
              children: [
                const Text(
                  "Sunset",
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
                Text(
                  "${global.calendarInfo[global.year.toString()][global.month.toString()][global.correctedDay]["sunset"]}",
                  style: const TextStyle(
                    fontSize: 12,
                  ),
                ),
              ],
            )
          ),
        ],
      ),
      centerTitle: true,
      backgroundColor: Colors.deepOrange.withOpacity(0.75),
      leading: Row(
        children: [
          PopupMenuButton(
            icon: const Icon(Icons.settings),
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: 1,
                child: Text("Home"),
              ),
              const PopupMenuItem(
                value: 2,
                child: Text("About"),
              ),
              const PopupMenuItem(
                value: 3,
                child: Text("Settings"),
              ),
            ],
            onSelected: (value) {
              switch (value) {
                case 1:
                  Navigator.popAndPushNamed(context, '/home');
                  break;
                case 2:
                  Navigator.popAndPushNamed(context, '/about');
                  break;
                case 3:
                  Navigator.popAndPushNamed(context, '/settings');
                  break;
              }
            },
          ),
        ],
      ),
      actions: [
        PopupMenuButton(
          icon: const Icon(Icons.menu),
          itemBuilder: (context) => [
            const PopupMenuItem(
              value: 1,
              child: Text("Srirangam"),
            ),
            const PopupMenuItem(
              value: 2,
              child: Text("Eastern"),
            ),
            const PopupMenuItem(
              value: 3,
              child: Text("Central"),
            ),
            const PopupMenuItem(
              value: 4,
              child: Text("Pacific"),
            ),
            const PopupMenuItem(
              value: 5,
              child: Text("Mountain"),
            ),
          ],
          onSelected: (value) {
            switch (value) {
              case 1:
                manualTimezoneChange("Srirangam");
                break;
              case 2:
                manualTimezoneChange("Eastern");
                break;
              case 3:
                manualTimezoneChange("Central");
                break;
              case 4:
                manualTimezoneChange("Pacific");
                break;
              case 5:
                manualTimezoneChange("Mountain");
                break;
            }
          },
        ),
      ],
    );
  }
}