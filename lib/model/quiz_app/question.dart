import 'package:flutter_gi_2026/model/quiz_app/answer.dart';

class Question {
  Question({required this.text, required this.answers});

  String text;
  List<Answer> answers;
}
