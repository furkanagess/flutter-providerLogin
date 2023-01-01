import 'package:flutter/cupertino.dart';

class LoginViewModel extends ChangeNotifier {
  bool isCheckBoxOpen = false;
  bool isLoading = false;
  String? _inputText;

  void checkBoxChange(bool value) {
    isCheckBoxOpen = value;
    notifyListeners();
  }

  Future<bool> controlTextValue(params) async {
    await Future.delayed(
      Duration(seconds: 1),
    );
    return _inputText != null;
  }
}
