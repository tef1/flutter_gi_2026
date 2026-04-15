import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gi_2026/quiz_app/screens/question_screen.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key, required this.onStartQuiz});
  final void Function(Widget) onStartQuiz;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset('assets/quiz_app/quiz_logo.png'),
          SizedBox(height: 24),
          Text(
            "Bienvenue dans ce Quiz ",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 16),
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.deepPurple,
              foregroundColor: Colors.white,
            ),
            onPressed: () {
              onStartQuiz(QuestionScreen());
            },
            icon: Icon(Icons.start, color: Colors.black),
            label: Text(
              'Commencer le Quiz',
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
