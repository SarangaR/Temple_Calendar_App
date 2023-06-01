import 'package:flutter/material.dart';
import 'package:kovil_app/widgets/global_appbar.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: GlobalAppBar(),
      body: Center(
        child: Text("About Page"),
      ),
    );
  }
}