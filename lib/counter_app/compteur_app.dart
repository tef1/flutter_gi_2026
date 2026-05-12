import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CompteurApp extends StatelessWidget {
  CompteurApp({super.key});

  @override
  Widget build(BuildContext context) {
    final message = Provider.of<String>(context);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(message),
            MyText(),
            // Text("counter value : $counter"),
            MyButton(),
          ],
        ),
      ),
    );
  }
}

class MyText extends StatelessWidget {
  MyText({super.key});

  @override
  Widget build(BuildContext context) {
    int c = context.watch<CompteurProvider>().counter;
    return Text("counter value is : $c");
  }
}

class MyButton extends StatelessWidget {
  const MyButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        context.read<CompteurProvider>().increments();
      },
      child: Text("increments"),
    );
  }
}

class CompteurProvider extends ChangeNotifier {
  int counter = 0;

  void increments() {
    counter++;
    notifyListeners();
  }
}
