import 'package:flutter/material.dart';
import 'package:flutter_gi_2026/test/my_button.dart';
import 'package:flutter_gi_2026/test/my_text.dart';

class TestApp extends StatefulWidget {
  TestApp({super.key});

  @override
  State<TestApp> createState() => _TestAppState();
}

class _TestAppState extends State<TestApp> {
  String message = "Hello";

  void changeMsg() {
    setState(() {
      message = "bonjour";
    });
    print(message);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MyText(message: message),
            MyButton(changeMsg: changeMsg),
          ],
        ),
      ),
    );
  }
}
