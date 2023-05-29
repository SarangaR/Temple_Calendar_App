import 'package:flutter/material.dart';
import 'package:kovil_app/about.dart';
import 'package:kovil_app/home_page.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

DateTime now = DateTime.now();
DateTime date = DateTime(now.year, now.month, now.day);
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

enum Items {home, about, settings}

class _SettingsPageState extends State<SettingsPage> {
  Items? selectedMenu;

  @override
  void initState() {
    super.initState();
    setState(() {
      updateDate();
    });
  }

  void updateDate() {
    now = DateTime.now();
    date = DateTime(now.year, now.month, now.day);
  }

  void switchPage(Items item) {
    switch (item) {
      case Items.about:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const AboutPage()),
        );
        break;
      case Items.settings:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const SettingsPage()),
        );
      case Items.home:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${date.day} ${monthLookup[date.month]} ${date.year}"),
        backgroundColor: Colors.deepOrange.withOpacity(0.75),
        centerTitle: true,
        leading: PopupMenuButton<Items>(
          icon: const Icon(Icons.menu),
          initialValue: selectedMenu,
          onSelected: (Items item) {
            setState(() {
              selectedMenu = item;
              switchPage(item);
            });
          },
          itemBuilder: (BuildContext context) => <PopupMenuEntry<Items>>[
            const PopupMenuItem<Items>(
              value: Items.about,
              child: Text('About'),
            ),
            const PopupMenuItem<Items>(
              value: Items.home,
              child: Text('Home'),
            ),
          ],
        ),
      ),
      body: const Center(child: Text('Settings Page')),
    );
  }
}