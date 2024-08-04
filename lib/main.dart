
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:receptionist/screens/splash_screen.dart';

import 'data/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SP.init();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen()
    );
  }
}
