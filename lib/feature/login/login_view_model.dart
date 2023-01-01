import 'package:flutter/cupertino.dart';

class LoginViewModel extends ChangeNotifier {
  bool isCheckBoxOpen = false;
  String? _inputText;

  void checkBoxChange(bool value) {
    isCheckBoxOpen = value;
    notifyListeners();
  }
}
