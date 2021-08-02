import 'package:flutter/material.dart';
import 'package:learn_flutter/counter/counter.dart';
import 'package:learn_flutter/student.dart';
import 'package:learn_flutter/calculator.dart';

//entry point
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
        // home: Student(),
      routes: {
        '/' : (context) => CounterScreen(),
        // '/' : (context) => Student(),
        '/calculator': (context) => Calculator(),
      },
      // home: Calculator(),
    );
  }
}




