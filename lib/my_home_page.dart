import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    int result;
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Container(
          color: Colors.cyan,
          child: Calculator()
          ),
          // child: Column(
          //   // Column is also a layout widget. It takes a list of children and
          //   // arranges them vertically. By default, it sizes itself to fit its
          //   // children horizontally, and tries to be as tall as its parent.
          //   //
          //   // Invoke "debug painting" (press "p" in the console, choose the
          //   // "Toggle Debug Paint" action from the Flutter Inspector in Android
          //   // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          //   // to see the wireframe for each widget.
          //   //
          //   // Column has various properties to control how it sizes itself and
          //   // how it positions its children. Here we use mainAxisAlignment to
          //   // center the children vertically; the main axis here is the vertical
          //   // axis because Columns are vertical (the cross axis would be
          //   // horizontal).
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: <Widget>[
          //     Text(
          //       'You have pushed the button this many times:',
          //     ),
          //     Text(
          //       '$_counter',
          //       style: Theme.of(context).textTheme.headline4,
          //     ),
          //   ],
          // ),
        ),

      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: Icon(Icons.add),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class Calculator extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Column( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [Result(), _buttonNumber(), _actionButton(), _resultButton("=")]);
    // );
  }

  Widget _buttonNumber(){
    return Column( children: [Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [_button("9"), _button("8"), _button("7")],) ,
      Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [_button("6"), _button("5"), _button("4")],),
      Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [_button("3"), _button("2"), _button("1")],),
      Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [_button(""), _button("0"), _button("")],)]);
  }

  Widget _button (String number){ // Creating a method of return type Widget with number and function f as a parameter
    return MaterialButton(
      height: 75.0,
      child: Text(number,
          style:  TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0)),
      textColor: Colors.black,
      color: Colors.amber[100],
      onPressed: (){},
    );
  }

  Widget _actionButton(){
    return Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [_button("+"),
      _button("-"),
      _button("/"),
      _button("*")],);
  }

  Widget _resultButton(String number){
    return MaterialButton(
        minWidth: 375,
        height: 75,
        child: Text(number,
            style:  TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0)),
        textColor: Colors.black,
        color: Colors.amber[100],
        onPressed: (){debugPrint("it's result");}
    );
  }
}

class Result extends StatelessWidget{
  @override
  Widget build(BuildContext context){
      return Container(
        width: double.infinity,
        height: 100,
        color: Colors.orangeAccent,
        child: Container(
          alignment: Alignment.bottomLeft,
          child: Text("test"
        ),
      )
      );
  }
}



