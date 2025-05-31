import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';

import 'splashscreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  runApp(
    DevicePreview(
      enabled: false,
      builder: (context) => MainApp(),
    )
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      debugShowCheckedModeBanner: false,
      title: 'Neural',
      home: SplashScreen(),
    );
  }
}
