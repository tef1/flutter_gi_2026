import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

class RiverpodCounter extends StatelessWidget {
  const RiverpodCounter({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [HelloWidget(), MyText(), MyButton()],
        ),
      ),
    );
  }
}

class CounterNotifier extends Notifier<int> {
  // CounterNotifier() : super(0);
  @override
  int build() => 0;

  void increments() {
    state++;
  }
}

final CounterNotifierProvider = NotifierProvider<CounterNotifier, int>(
  CounterNotifier.new,
);

class MyText extends ConsumerWidget {
  MyText({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print("MyText build method called");
    // int c = context.watch<CompteurProvider>().counter;
    int c = ref.watch(CounterNotifierProvider);
    // int c = ref.watch(counterPvd);
    return Text("counter value is : $c");
  }
}

class MyButton extends ConsumerWidget {
  const MyButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print("MyButton build method called");
    return ElevatedButton(
      onPressed: () {
        // context.read<CompteurProvider>().increments();
        ref.read(CounterNotifierProvider.notifier).increments();
        // ref.read(counterPvd.notifier).state++;
      },
      child: Text("increments"),
    );
  }
}

class HelloWidget extends ConsumerWidget {
  HelloWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print("Hello Widget build method called");
    // int c = context.watch<CompteurProvider>().counter;
    // ref.watch(CounterNotifierProvider);
    ref.watch(counterPvd);
    return Text("Hell World");
  }
}

final counterPvd = StateProvider<int>((ref) => 0);
