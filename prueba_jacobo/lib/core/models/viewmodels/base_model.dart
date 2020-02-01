/*
 * BaseModel
 * 
 * This class contains is the basic model that every widget that
 * will be built.
 * 
 * Should be used with BaseWidget to separate the front-end logic
 * of the back-end logic. 
 */

import 'package:flutter/material.dart';

class BaseModel extends ChangeNotifier {
  bool _busy = false;
  bool get busy => _busy;

  void setBusy(bool value) {
    _busy = value;
    notifyListeners();
  }
}