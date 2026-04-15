import 'package:flutter/material.dart';

class MyText extends StatelessWidget {
  MyText({super.key, required this.message});
  final String message;

  @override
  Widget build(BuildContext context) {
    return Text(message);
  }
}
