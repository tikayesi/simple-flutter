import 'package:flutter/material.dart';
import 'package:learn_flutter/counter/button_counter_min.dart';
import 'package:learn_flutter/counter/button_counter_plus.dart';

class CounterOperator extends StatelessWidget {
  const CounterOperator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(child:
    Row(
      children: [
        ButtonCounterPlus(),
        ButtonCounterMin()
      ],
    ),);
  }
}
