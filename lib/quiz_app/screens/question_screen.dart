import 'package:flutter/material.dart';
import 'package:flutter_gi_2026/data/quiz_app/dummy_data.dart';
import 'package:flutter_gi_2026/model/quiz_app/answer.dart';
import 'package:flutter_gi_2026/model/quiz_app/question.dart';
import 'package:flutter_gi_2026/model/quiz_app/user_answer.dart';
import 'package:flutter_gi_2026/quiz_app/screens/summary_screen.dart';

class QuestionScreen extends StatefulWidget {
  QuestionScreen({super.key});

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  List<Question> questions = dummyQuestions;
  List<UserAnswer> answers = [];

  int currentQuestionIndex = 0;

  void nextQuestion(Question q, Answer a) {
    answers.add(UserAnswer(answer: a, question: q));
    if (currentQuestionIndex < questions.length - 1) {
      setState(() {
        currentQuestionIndex++;
      });
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => SummaryScreen(answers: answers),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Text(
                questions[currentQuestionIndex].text,
                style: TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
              ),
            ),

            for (int i = 0; i < 4; i++)
              AnswerWidget(
                answer: questions[currentQuestionIndex].answers[i],
                nextQuestion: nextQuestion,
                q: questions[currentQuestionIndex],
              ),
          ],
        ),
      ),
    );
  }
}

class AnswerWidget extends StatelessWidget {
  AnswerWidget({
    super.key,
    required this.answer,
    required this.nextQuestion,
    required this.q,
  });

  final Question q;
  final Answer answer;
  final void Function(Question, Answer) nextQuestion;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => nextQuestion(q, answer),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.purple,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(
            child: Text(
              answer.text,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
