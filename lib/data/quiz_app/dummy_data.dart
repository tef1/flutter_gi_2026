import 'package:flutter_gi_2026/model/quiz_app/answer.dart';
import 'package:flutter_gi_2026/model/quiz_app/question.dart';

List<Question> dummyQuestions = [
  Question(
    text: "What is the capital of France?",
    answers: [
      Answer(text: "Paris", isCorrect: true),
      Answer(text: "London", isCorrect: false),
      Answer(text: "Berlin", isCorrect: false),
      Answer(text: "Madrid", isCorrect: false),
    ],
  ),
  Question(
    text: "What is the largest planet in our solar system?",
    answers: [
      Answer(text: "Earth", isCorrect: false),
      Answer(text: "Mars", isCorrect: false),
      Answer(text: "Jupiter", isCorrect: true),
      Answer(text: "Saturn", isCorrect: false),
    ],
  ),
];
