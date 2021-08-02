import 'package:flutter/material.dart';

class ButtonCounterPlus extends StatelessWidget {
  final Function increment;
  const ButtonCounterPlus({Key? key, required this.increment}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextButton(onPressed: () => increment(), child: Text("+")),
    );
  }
}
