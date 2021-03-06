import 'package:flutter/material.dart';
import 'package:learn_flutter/counter/button_counter_min.dart';
import 'package:learn_flutter/counter/button_counter_plus.dart';
import 'package:learn_flutter/counter/counter_operator.dart';
import 'package:learn_flutter/counter/counter_view_model.dart';
import 'package:provider/provider.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({Key? key}) : super(key: key);

  @override
  _CounterScreenState createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: ChangeNotifierProvider(
            create: (context) => CounterViewModel(),
            builder: (context, child){
              return Column(
                children: [
                  Text('${context.watch<CounterViewModel>().val}'),
                  CounterOperator()
                ],
              );
            },
    )));
  }
}
