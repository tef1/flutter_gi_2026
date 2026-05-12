import 'package:flutter/material.dart';
import 'package:flutter_gi_2026/providers/shop_app/shop_app_provider.dart';
import 'package:flutter_gi_2026/quiz_app/quiz_app.dart';
import 'package:flutter_gi_2026/shop_app/shop_app.dart';
import 'package:flutter_gi_2026/test/test_app.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ShopAppProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(textTheme: GoogleFonts.robotoTextTheme()),
      home: ShopApp(),
    );
  }
}
