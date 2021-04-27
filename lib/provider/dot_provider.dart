import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:collection/collection.dart';

enum DotState {
  idle,
  complete,
  success,
  failed,
}

class DotProvider with ChangeNotifier {
  int _numberOfDot = 4;

  get numberOfDot => _numberOfDot;

  List<DotState> _dotsState = [];
  get dotsState => _dotsState;

  /// `unlock Code`
  List<int> _passCode = [1, 4, 6, 9];

  List<int> _userInput = [-1, -1, -1, -1];

  get userInput => _userInput;

  DotProvider() {
    backToIdleDot();
  }

  updateDotState(int index, DotState _state) {
    _dotsState[index] = _state;
    notifyListeners();
  }

  updateUserInput(int index, int userInputDigit) {
    _userInput[index] = userInputDigit;
    notifyListeners();
  }

  backToIdleDot() {
    _dotsState = List.generate(numberOfDot, (index) => DotState.idle);
    notifyListeners();
  }

  Future<void> _refresh() async {
    /// a little delay until fadeOut complete
    Future.delayed(Duration(milliseconds: 250), () {
      _userInput = [-1, -1, -1, -1];
      backToIdleDot();
    });
  }

//user input validation
  bool validateUser() {
    print("user: $userInput  pass: $_passCode");

    /// for more complex use `DeepCollectionEquality()`
    Function eq = const ListEquality().equals;
    return eq(_userInput, _passCode);
  }

  ///helper for getting InnerColor
  Color containerInnderColor(DotState state) {
    final _containerInnerColor;
    if (state == DotState.success)
      _containerInnerColor = Colors.green;
    else if (state == DotState.failed)
      _containerInnerColor = Colors.red;
    else
      _containerInnerColor = Colors.white;
    return _containerInnerColor;
  }

  ///` Dot animataion Helper`
  ///after validation
  _fadeOut() {
    /// change assign userInput & change COlor
    int _index = 0;
    Timer.periodic(Duration(milliseconds: 100), (timer) async {
      if (_index >= _numberOfDot) {
        timer.cancel();
        _refresh();
      } else {
        updateDotState(_index, DotState.idle);
        _index += 1;
      }
      notifyListeners();
    });
  }

  validAnimation() async {
    /// this method will animate after  user enter the 4th digit
    /// maybe we call add a little delay here
    int _index = 0;
    Timer.periodic(Duration(milliseconds: 100), (timer) {
      if (_index >= _numberOfDot) {
        timer.cancel();

        /// passCode visibility just before fadeOut
        Future.delayed(Duration(milliseconds: 500), () {
          _fadeOut();
        });
      } else {
        updateDotState(
            _index, validateUser() ? DotState.success : DotState.failed);
        _index += 1;
      }
      notifyListeners();
    });
  }
}
