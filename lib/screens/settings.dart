import 'package:flutter/material.dart';
import 'package:kovil_app/widgets/global_appbar.dart';
import 'package:kovil_app/global_vars.dart' as global;

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GlobalAppBar(),
      bottomNavigationBar: FloatingActionButton.extended(
        onPressed: () {
          Navigator.popAndPushNamed(context, "/home");
        },
        icon: const Icon(Icons.arrow_back),
        label: const Text("Back")
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: const Text("Auto Timezone Sync"),
            trailing: Switch(
              value: global.autoTimezoneSync,
              onChanged: (value) {
                setState(() {
                  global.autoTimezoneSync = value;
                  if (global.autoTimezoneSync) {
                    global.getLocalTimezone();
                    global.writeTz("");
                    Navigator.popAndPushNamed(context, '/settings');
                  }
                });
              },
            ),
          ),
          ListTile(
            title: global.autoTimezoneSync ? const Text("") : const Text("Timezone"),
            trailing: Visibility(
              visible: !global.autoTimezoneSync,
              child: DropdownButton(
                hint: Text(global.timeZone.toString()),
                items: const [
                  DropdownMenuItem(
                    value: "Srirangam",
                    child: Text("Srirangam"),
                  ),
                  DropdownMenuItem(
                    value: "Eastern",
                    child: Text("Eastern"),
                  ),
                  DropdownMenuItem(
                    value: "Central",
                    child: Text("Central"),
                  ),
                  DropdownMenuItem(
                    value: "Mountain",
                    child: Text("Mountain"),
                  ),
                  DropdownMenuItem(
                    value: "Pacific",
                    child: Text("Pacific"),
                  ),
                ],
                onChanged: (value) {
                  setState(() {
                    global.timeZone = value.toString();
                    global.writeTz(global.timeZone);
                    Navigator.popAndPushNamed(context, '/settings');
                  });
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}