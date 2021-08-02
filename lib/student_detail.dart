import 'package:flutter/material.dart';
import 'package:learn_flutter/student.dart';

class StudentDetail extends StatefulWidget {
  const StudentDetail({Key? key, required this.stu}) : super(key: key);

  final std stu;

  @override
  _State createState() => _State();
}

class _State extends State<StudentDetail> {
  Row _colDet(String initi, String value) {
    return Row(
      children: [
        Expanded(
          child: Text(initi),
        ),
        Expanded(child: Text(value))
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
          width: 300,
          height: 200,
          padding: new EdgeInsets.all(10.0),
          child: Column(
            children: [
              Row(
                children: [
                  FlatButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Icon(Icons.arrow_back)),
                  Text(
                    "Student Detail",
                    style: TextStyle(color: Colors.orange, fontSize: 20),
                  ),
                ],
              ),
              Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  color: Colors.red,
                  elevation: 10,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            _colDet("Id", (widget.stu.id).toString()),
                            _colDet('Name', widget.stu.name),
                            _colDet("Age", widget.stu.age)
                          ],
                        ),
                      )
                    ],
                  )),
            ],
          )),
    ));
  }
}
