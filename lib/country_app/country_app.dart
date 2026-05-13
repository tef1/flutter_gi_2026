import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

class CountryApp extends ConsumerWidget {
  CountryApp({super.key});
  // var countries = ["morocco"];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print("Country build called");
    List<String> countries = ref.watch(countryNotifierProvider);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (String c in countries) ListTile(title: Text(c)),
            ElevatedButton(
              onPressed: () {
                ref.read(countryNotifierProvider.notifier).addCountry();
              },
              child: Text("Add Country"),
            ),
          ],
        ),
      ),
    );
  }
}

class CountryNotifier extends StateNotifier<List<String>> {
  CountryNotifier() : super(["Morocco"]);

  void addCountry() {
    print("in add method");
    // state.add("Egypte");
    state = [...state, "Egypte"];
    print(state.length);
  }
}

final countryNotifierProvider =
    StateNotifierProvider<CountryNotifier, List<String>>(
      (ref) => CountryNotifier(),
    );
