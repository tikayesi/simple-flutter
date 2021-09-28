
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:learn_flutter/model/student.dart';
import 'package:learn_flutter/repository/student_repository.dart';
import 'package:learn_flutter/student_detail.dart';
import 'package:learn_flutter/widget/text_field_widget.dart';

class StudentScreen extends StatefulWidget{

  @override
  _Student createState() => _Student();

}

class _Student extends State<StudentScreen>{
  StudentRepository _studentRepository = StudentRepository();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController name = new TextEditingController();
  TextEditingController age = new TextEditingController();


  @override
  Widget build(BuildContext context) {


    // Widget _listBookName(){
    //   return Padding(
    //     padding: const EdgeInsets.symmetric(vertical: 16.0),
    //     child: Column(children: names.map((item) => new Text(item)).toList()),
    //
    //   );
    // }


    return SafeArea(child: Scaffold(
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("STUDENT LIST", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.orange, fontSize: 20.0),),
            ),
            SizedBox(height: 20.0,),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    TextFormField(
                      controller: name,
                      decoration: const InputDecoration(
                        hintText: 'Enter your name',
                      ),
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                    TextFieldWidget(controller: age, 
                    hintText: 'Enter Your Age',
                    validator: MultiValidator(
                      [
                        RequiredValidator(errorText: 'Age is required'),
                        MinLengthValidator(5, errorText: '5 min char')
                      ]
                    ),
                    ),

                    // TextFormField(
                    //   controller: age,
                    //   decoration: const InputDecoration(
                    //     hintText: 'Enter your age',
                    //   ),
                    //   validator: (String? value) {
                    //     if (value == null || value.isEmpty) {
                    //       return 'Please enter some text';
                    //     }
                    //     return null;
                    //   },
                    // ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            setState(() {
                              //students.add(new Student(students.length+1, name.text, age.text));
                              _studentRepository.addStudent(new Student(_studentRepository.getAllStudent().length+1, name.text, age.text));
                            });
                          }
                        },
                        child: const Text('Submit'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
              SizedBox(height: 50,),
          Expanded(
              child: Card(
              margin: EdgeInsets.fromLTRB(20, 30, 20, 0),
              child: Scrollbar(
                child: ListView.builder(
                  padding: const EdgeInsets.all(8),
                  itemBuilder: (context, index) {
                    return Column(
                      children: <Widget>[
                        Row(
                          children: [
                            Expanded(child: ListTile(
                              leading: Icon(
                                Icons.account_circle,
                                size: 40.0,
                              ),
                              title: Text(
                                _studentRepository.getAllStudent()[index].name,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => StudentDetail(stu: _studentRepository.getAllStudent()[index],)));
                              },
                            ),),
                            Expanded(child: TextButton(onPressed: (){
                              setState(() {
                                _studentRepository.deleteStudent(_studentRepository.getAllStudent()[index].id);
                              });
                            }, child: Icon(Icons.delete)),)

                          ],
                        ),
                        Divider(
                          height: 5.0,
                        ),
                      ],
                    );
                  },
                  itemCount: _studentRepository.getAllStudent().length,
                ),
              ),
            ),
          )
          ],
        )
      ),
    ));
  }

}