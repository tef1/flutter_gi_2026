import 'package:flutter/material.dart';
import 'package:flutter_gi_2026/quiz_app/quiz_app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home: const QuizApp(),
    );

  }
}
