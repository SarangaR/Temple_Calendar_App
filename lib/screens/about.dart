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
    return Scaffold(
      appBar: const GlobalAppBar(),
      bottomNavigationBar: FloatingActionButton.extended(
        onPressed: () {
          Navigator.popAndPushNamed(context, "/home");
        },
        icon: const Icon(Icons.arrow_back),
        label: const Text("Back")
      ),
      body: const Center(
        child: Text(
          "About Page\n\nDevelopment Version",
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}