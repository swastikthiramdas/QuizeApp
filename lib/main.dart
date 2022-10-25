import 'package:flutter/material.dart';
import 'package:quizeapp/pages/splash_screan.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Quize App",
      theme: ThemeData(
        primarySwatch: Colors.cyan
      ),
      home: SplashScrean(),
    );
  }
}
