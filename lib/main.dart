import 'package:flutter/material.dart';
import 'pages/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CampusLink',

      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFF5EBDD),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF7A1F3D),
        ),
      ),

      home: const HomePage(),
    );
  }
}

