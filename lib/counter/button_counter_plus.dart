import 'package:flutter/material.dart';
import 'package:learn_flutter/counter/counter_view_model.dart';
import 'package:provider/provider.dart';

class ButtonCounterPlus extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextButton(onPressed: (){
        // Provider.of<CounterViewModel>(context, listen: false).incrementValue();
        context.read<CounterViewModel>().incrementValue();
        // CounterViewModel().incrementValue();
      }, child: Text("+")),
    );
  }
}
