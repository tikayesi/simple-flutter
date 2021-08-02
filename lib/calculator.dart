import 'package:flutter/material.dart';
import 'package:learn_flutter/button_of_number.dart';
import 'package:math_expressions/math_expressions.dart';



class Calculator extends StatefulWidget {
  String input = "";
  final textInput = TextEditingController();
  final textResult = TextEditingController();
  @override
  State createState() => CalculatorState();
}

class CalculatorState extends State<Calculator> {


  void callback(numberStr) {
    setState(() {
      widget.textInput.text = widget.textInput.text + numberStr;
    });
  }

  @override
  void initState() {
    super.initState();

    widget.textInput.addListener(() {});
    widget.textResult.addListener(() {});
  }

  @override
  void dispose() {
    widget.textInput.dispose();
    widget.textResult.dispose();
    super.dispose();
  }

  Row buttonRowAction() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        ButtonOfNumber(textNumber: "+", callbacks: () => callback("+")),
        ButtonOfNumber(textNumber: '-', callbacks: () => callback('-')),
        MaterialButton(
            height: 75.0,
            elevation: 10,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0), side: BorderSide(color: Colors.red)),
            child: Text("C",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0)),
            textColor: Colors.black,
            color: Colors.redAccent[100],
            onPressed: () {
              setState(() {
                widget.textInput.text = "";
                widget.textResult.text = "";
              });
            })
      ],
    );
  }

  Widget _buttonOfNumberBuilder(String textNum) {
    return ButtonOfNumber(
        textNumber: textNum, callbacks: () => callback(textNum));
  }

  // Row buttonRow() {
  //   List<String> num = ['0', '*', "/"];
  //   return Row(
  //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //     children: List.generate(
  //         num.length, (index) => _buttonOfNumberBuilder(num[index])),
  //   );
  // }
  //
  // Widget buttonRow1() {
  //   List<String> num = ['7', '8', '9'];
  //   return Row(
  //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //       children: List.generate(
  //           num.length, (index) => _buttonOfNumberBuilder(num[index])));
  // }
  //
  // Row buttonRow2() {
  //   List<String> num = ['4', '5', '6'];
  //   return Row(
  //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //     children: List.generate(
  //         num.length, (index) => _buttonOfNumberBuilder(num[index])),
  //   );
  // }
  //
  // Row buttonRow3() {
  //   List<String> num = ['1', '2', '3'];
  //   return Row(
  //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //       children: List.generate(
  //           num.length, (index) => _buttonOfNumberBuilder(num[index])));
  // }

  Row _button(List<String> list){
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(
            list.length, (index) => _buttonOfNumberBuilder(list[index])));
  }

  Widget buttonResult() {
    return MaterialButton(
        height: 75.0,
        minWidth: 325,
        child: Text("=",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0)),
        textColor: Colors.black,
        color: Colors.cyan,
        onPressed: () {
          Parser p = Parser();
          ContextModel cm = ContextModel();
          Expression exp = p.parse(widget.textInput.text);
          setState(() {
            widget.textResult.text = exp.evaluate(EvaluationType.REAL, cm).toString();
          });
        });
  }

  Column keyPad() {
    List<List<String>> col = [['7','8','9'], ['4','5','6'],['1','2','3'],['0','*','/']];

    // List<Widget> row = [
    //   buttonRow(),
    //   buttonRow1(),
    //   buttonRow2(),
    //   buttonRow3(),
    //   // buttonRowAction(),
    //   // buttonResult()
    // ];
    return Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(col.length, (index) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: _button(col[index]),
        )),
        // children: List.generate(
        //     row.length,
        //     (index) => Padding(
        //           padding: const EdgeInsets.all(8.0),
        //           child: row[index],
        //         )
        // )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text(
          "Calculator",
          style: TextStyle(color: Colors.redAccent),
        ),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: TextField(
                decoration: InputDecoration.collapsed(hintText: ""),
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w400),
                textAlign: TextAlign.right,
                controller: widget.textInput,
                onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: TextField(
                decoration: InputDecoration.collapsed(
                    hintText: "0", fillColor: Colors.amberAccent),
                textInputAction: TextInputAction.none,
                keyboardType: TextInputType.number,
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w400,
                    color: Colors.orange),
                textAlign: TextAlign.right,
                controller: widget.textResult,
              ),
            ),
            SizedBox(
              height: 50,
            ),
            keyPad(),
            buttonRowAction(),
            buttonResult()
          ],
        ),
      ),
    );
  }
}
