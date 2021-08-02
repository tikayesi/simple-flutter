import 'package:flutter/material.dart';

class ButtonOfNumber extends StatelessWidget {
  final String textNumber;
  final Function callbacks;
  const ButtonOfNumber({Key? key, required this.textNumber, required this.callbacks}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: 75.0,
      elevation: 10,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0), side: BorderSide(color: Colors.red)),
      child: Text(textNumber,
          style:  TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0)),
      textColor: Colors.black,
      color: Colors.amber[100],
      onPressed: () => callbacks(),
    );
  }
}


// import 'package:flutter/material.dart';
//
// class ButtonOfNumber extends StatefulWidget{
//   final String number;
//   final Function callbacks;
//
//   ButtonOfNumber(this.number, this.callbacks);
//
//   @override
//   _ButtonOfNumberState createState() => _ButtonOfNumberState();
//
// }
//
// class _ButtonOfNumberState extends State<ButtonOfNumber>{
//   @override
//   Widget build(BuildContext context){
//     return MaterialButton(
//       height: 75.0,
//       child: Text(widget.number,
//           style:  TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0)),
//       textColor: Colors.black,
//       color: Colors.amber[100],
//       onPressed: () => widget.callbacks(),
//     );
//   }
// }