import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  const MyButton({super.key, required this.changeMsg});
  final void Function() changeMsg;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: changeMsg, child: Text("Cliquez moi"));
  }
}
