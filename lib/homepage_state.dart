import 'package:flutter/material.dart';
import 'dart:math';

class HomePageState with ChangeNotifier {
  static var randomizer = new Random();
  final _formKey = GlobalKey<FormState>();

  int _ansNum = randomizer.nextInt(900) + 100;
  int _subNum = 0;

  int get ansNum => this._ansNum;
  int get subNum => this._subNum;
  GlobalKey get formKey => this._formKey;

  void setSubNum (int num) {
    this._subNum = num;
    notifyListeners();
  }

  List<int> checkSubmission (int num) {
    int ansNumThird = this.ansNum ~/ 100;
    int tmp = this.ansNum % 100;
    int ansNumSecond = tmp ~/ 10;
    int ansNumFirst = tmp % 10;
  }
}
