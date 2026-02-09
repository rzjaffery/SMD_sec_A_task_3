import 'package:flutter/material.dart';
import 'screens/adaptive_layout_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Adaptive Layout',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const AdaptiveLayoutPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}