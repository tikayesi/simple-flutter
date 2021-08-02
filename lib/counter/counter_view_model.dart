import 'package:flutter/material.dart';

class CounterViewModel extends ChangeNotifier{
  int _val = 0;
  int get val => _val;

  decrementValue(){
      _val--;
      print(val);
      notifyListeners();
  }

  incrementValue(){
      _val++;
      print(val);
      notifyListeners();
  }
}
