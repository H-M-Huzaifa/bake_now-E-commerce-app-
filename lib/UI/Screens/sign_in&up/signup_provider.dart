import 'package:flutter/cupertino.dart';

class class_sign_up_provider with ChangeNotifier{
bool _isPasswordVisible = false;
bool _isConfirmPasswordVisible = false;

bool get isPasswordVisible => _isPasswordVisible;
bool get isConfirmPasswordVisible => _isConfirmPasswordVisible;

void togglePasswordVisibility() {
  _isPasswordVisible = !_isPasswordVisible;
  notifyListeners();
}

void toggleConfirmPasswordVisibility() {
  _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
  notifyListeners();
}
}