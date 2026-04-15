import 'package:flutter_gi_2026/model/quiz_app/answer.dart';
import 'package:flutter_gi_2026/model/quiz_app/question.dart';

class UserAnswer {
  UserAnswer({required this.answer, required this.question});

  Question question;
  Answer answer;
}
