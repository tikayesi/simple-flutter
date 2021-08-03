import 'package:learn_flutter/model/student.dart';

class StudentRepository{

  var studentList = [Student(1, "Tika", "23"), Student(2, "Yesi", "22")];

  List<Student> getAllStudent(){
    return studentList;
  }

  addStudent(Student newStudent){
    studentList.add(newStudent);
  }

  deleteStudent(int id){
    studentList.removeWhere((element) => element.id == id);
  }
}