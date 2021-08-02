import 'package:flutter/material.dart';
import 'package:learn_flutter/counter/button_counter_min.dart';
import 'package:learn_flutter/counter/button_counter_plus.dart';

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
              ButtonCounterPlus(increment: _incrementValue,),
              ButtonCounterMin(decrement: _decrementValue,)
            ],
          ),
        ],
      ),
    ));
  }
}

