import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({Key? key}) : super(key: key);

  @override
  _CounterScreenState createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int val=0;

  _decrementValue(){
    setState(() {
      val--;
      print(val);
    });
  }

  _incrementValue(){
    setState(() {
      val++;
      print(val);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Column(
        children: [
          Text(val.toString()),
          Row(
            children: [
              TextButton(onPressed: _incrementValue, child: Text("+")),
              TextButton(onPressed: _decrementValue, child: Text("-")),
            ],
          ),
        ],
      ),
    ));
  }
}

