import 'package:flutter/material.dart';

class ButtonCounterMin extends StatelessWidget {
  final Function decrement;
  const ButtonCounterMin({Key? key, required this.decrement}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextButton(onPressed: () => decrement(), child: Text("-")),
    );
  }
}
