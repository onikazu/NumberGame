import 'package:flutter/material.dart';
import 'dart:math';

class HomePageState with ChangeNotifier {
  static var randomizer = new Random();
  final _formKey = GlobalKey<FormState>();
  int _ansNum = randomizer.nextInt(900) + 100;

  int _subNum = 0;
  int _hitNum = 0;
  int _biteNum = 0;
  int _challengeNum = 0;

  int get ansNum => this._ansNum;

  int get subNum => this._subNum;

  int get hitNum => this._hitNum;

  int get biteNum => this._biteNum;

  int get challengeNum => this._challengeNum;

  GlobalKey get formKey => this._formKey;

  void submit(int num) {
    // remove dup num pattern
    int numThird = num ~/ 100;
    int tmp = num % 100;
    int numSecond = tmp ~/ 10;
    int numFirst = tmp % 10;

    while (numFirst == numSecond ||
        numFirst == numThird ||
        numSecond == numThird) {
      this._ansNum = randomizer.nextInt(900) + 100;
    }

    this._subNum = num;
    this._hitNum = checkHit(num);
    this._biteNum = checkBite(num);
    this._challengeNum++;
    print("========== Result #${this._challengeNum} =============");
    print(
        "ansNum: ${this._ansNum}, subNum: ${this._subNum}, hitNum: ${this._hitNum}, biteNum: ${this._biteNum}\n");

    notifyListeners();
  }

  int checkHit(int num) {
    int ansNumThird = this._ansNum ~/ 100;
    int tmp = this._ansNum % 100;
    int ansNumSecond = tmp ~/ 10;
    int ansNumFirst = tmp % 10;

    int subNumThird = this._subNum ~/ 100;
    tmp = this._subNum % 100;
    int subNumSecond = tmp ~/ 10;
    int subNumFirst = tmp % 10;

    int result = 0;

    if (ansNumFirst == subNumFirst) {
      result++;
    }
    if (ansNumSecond == subNumSecond) {
      result++;
    }
    print(result);
    if (ansNumThird == subNumThird) {
      result++;
    }
    return result;
  }

  int checkBite(int num) {
    int ansNumThird = this._ansNum ~/ 100;
    int tmp = this._ansNum % 100;
    int ansNumSecond = tmp ~/ 10;
    int ansNumFirst = tmp % 10;

    int subNumThird = this._subNum ~/ 100;
    tmp = this._subNum % 100;
    int subNumSecond = tmp ~/ 10;
    int subNumFirst = tmp % 10;

    int result = 0;

    if (ansNumFirst == subNumThird) {
      result++;
    }
    if (ansNumFirst == subNumSecond) {
      result++;
    }
    print(result);
    if (ansNumSecond == subNumThird) {
      result++;
    }
    if (ansNumSecond == subNumFirst) {
      result++;
    }
    if (ansNumThird == subNumFirst) {
      result++;
    }
    print(result);
    if (ansNumThird == subNumSecond) {
      result++;
    }
    return result;
  }
}
