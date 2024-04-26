import 'package:candidat/pages/candidat_inscription_pages.dart';
import 'package:candidat/pages/candidat_pages.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Vote",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0X5e8851)),
      ),
      routes: {
        '/inscription': (context) => (candidat_inscription()),
      },
      home: presentation(),
    );
  }
}
