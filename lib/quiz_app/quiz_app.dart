import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gi_2026/quiz_app/screens/question_screen.dart';
import 'package:flutter_gi_2026/quiz_app/screens/startScreen.dart';

class QuizApp extends StatefulWidget {
  const QuizApp({super.key});

  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  late Widget activeScreen = StartScreen(
    onStartQuiz: (Widget w) => changeScreen(w),
  );

  void changeScreen(Widget screen) {
    setState(() {
      activeScreen = screen;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: activeScreen);
  }
}
