import 'package:flutter/material.dart';
import 'package:learn_flutter/counter/counter_view_model.dart';
import 'package:provider/provider.dart';

class ButtonCounterMin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextButton(onPressed: () {
        //Provider.of<CounterViewModel>(context, listen: false).decrementValue();
        context.read<CounterViewModel>().decrementValue();
      }, child: Text("-")),
    );
  }
}
