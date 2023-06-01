import 'package:flutter/material.dart';
import 'package:kovil_app/screens/about.dart';
import 'package:kovil_app/screens/home_page.dart';
import 'package:kovil_app/global_vars.dart' as global;
import 'package:kovil_app/screens/settings.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await global.readJson();
  final runnableApp = _buildRunnableApp(
    isWeb: false,
    webAppWidth: 480,
    app: const MainApp(),
  );
  runApp(runnableApp);
}

Widget _buildRunnableApp({
  required bool isWeb,
  required double webAppWidth,
  required Widget app,
}) {
  if (!isWeb) {
    return app;
  }

  return Center(
    child: ClipRect(
      child: SizedBox(
        width: webAppWidth,
        child: app,
      ),
    ),
  );
}

DateTime now = DateTime.now();
DateTime date = DateTime(now.year, now.month, now.day);

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        useMaterial3: true,
      ),
      home: const HomePage(),
      routes: {
        '/home': (context) => const HomePage(),
        '/about':(context) => const AboutPage(),
        '/settings':(context) => const SettingsPage(),
      },
    );
  }
}
