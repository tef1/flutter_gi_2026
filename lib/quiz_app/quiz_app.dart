import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gi_2026/quiz_app/screens/startScreen.dart';

class QuizApp extends StatefulWidget {
  const QuizApp({super.key});

  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StartScreen(onStartQuiz: ()=> {}),
    );
  }
}
