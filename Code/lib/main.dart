import 'package:flutter/material.dart';

import 'Pages/calculatorApp.dart';
import 'Pages/intro.dart';
import 'Pages/stopwatch.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home:stopwatch(),
    );
  }
}

