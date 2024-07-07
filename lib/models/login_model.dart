import 'package:flutter/material.dart';

class LoginModel {
  String? username;
  String? password;

  LoginModel();
}

class LoginViewModel {
  final LoginModel model;
  TextEditingController? emailAddressTextController = TextEditingController();
  TextEditingController? passwordTextController = TextEditingController();
  FocusNode? emailAddressFocusNode = FocusNode();
  FocusNode? passwordFocusNode = FocusNode();
  bool passwordVisibility = false;
  final FocusNode unfocusNode = FocusNode();

  LoginViewModel({required this.model}) {
    emailAddressFocusNode?.addListener(() {
      if (emailAddressFocusNode != null && !emailAddressFocusNode!.hasFocus) {
        model.username = emailAddressTextController?.text;
      }
    });

    passwordFocusNode?.addListener(() {
      if (!passwordFocusNode!.hasFocus) {
        model.password = passwordTextController?.text;
      }
    });
  }

  String? emailAddressTextControllerValidator(String? emailAddress) {
    if (emailAddress == null || emailAddress.isEmpty) {
      return 'Vui lòng nhập email';
    }
    RegExp regExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!regExp.hasMatch(emailAddress)) {
      return 'Email không hợp lệ';
    }
    return null;
  }

  String? passwordTextControllerValidator(String? password) {
    if (password == null || password.isEmpty) {
      return 'Vui lòng nhập mật khẩu';
    }
    RegExp regExp = RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d@?!_*&%#]{8,}$');
    if (!regExp.hasMatch(password)) {
      return 'Mật khẩu phải chứa ít nhất 8 ký tự, bao gồm chữ cái và số';
    }
    return null;
  }

  void dispose() {
    unfocusNode.dispose();
  }
}
