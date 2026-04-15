import 'package:flutter/material.dart';
import 'package:flutter_gi_2026/model/quiz_app/answer.dart';
import 'package:flutter_gi_2026/model/quiz_app/user_answer.dart';

class SummaryScreen extends StatelessWidget {
  const SummaryScreen({super.key, required this.answers});

  final List<UserAnswer> answers;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (UserAnswer u in answers)
              Column(
                children: [
                  Text(
                    u.question.text,
                    style: TextStyle(fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                  for (Answer a in u.question.answers)
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: a.isCorrect
                              ? Colors.green
                              : (a == u.answer ? Colors.red : Colors.purple),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Center(
                          child: Text(
                            a.text,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
