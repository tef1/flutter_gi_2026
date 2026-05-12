import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CounterApp extends StatefulWidget {
  CounterApp({super.key});

  @override
  State<CounterApp> createState() => _CounterAppState();
}

class _CounterAppState extends State<CounterApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [MyText(), MyButton()],
        ),
      ),
    );
  }
}

class MyButton extends StatelessWidget {
  MyButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        context.read<CounterProvider>().increments();
      },
      child: Text("increments"),
    );
  }
}

class MyText extends StatelessWidget {
  const MyText({super.key});

  @override
  Widget build(BuildContext context) {
    int counter = context.watch<CounterProvider>().counter;
    return Text("counter value : $counter");
  }
}

class CounterProvider extends ChangeNotifier {
  int counter = 0;

  void increments() {
    counter++;
    notifyListeners();
  }
}
