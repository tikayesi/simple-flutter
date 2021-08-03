

import 'package:flutter/material.dart';
import 'package:learn_flutter/data_source.dart';
import 'package:learn_flutter/student_detail.dart';

class Student extends StatefulWidget{

  @override
  _Student createState() => _Student();

}

class std{
  int id;
  String name;
  String age;

  std(this.id, this.name, this.age);
}

class _Student extends State<Student>{
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController name = new TextEditingController();
  TextEditingController age = new TextEditingController();


  void deleteNames(int name){
    setState(() {
      names.removeWhere((element) => element.id == name);
    });
  }

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
                    TextFormField(
                      controller: age,
                      decoration: const InputDecoration(
                        hintText: 'Enter your age',
                      ),
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            setState(() {
                              names.add(new std(names.length+1, name.text, age.text));
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
                                names[index].name,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => StudentDetail(stu: names[index],)));
                              },
                            ),),
                            Expanded(child: TextButton(onPressed: () => deleteNames(names[index].id), child: Icon(Icons.delete)),)

                          ],
                        ),
                        Divider(
                          height: 5.0,
                        ),
                      ],
                    );
                  },
                  itemCount: names.length,
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