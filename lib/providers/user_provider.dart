import 'package:ecommerce_clone/model/user.dart';
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  User _user = User(
    address: '',
    email: '',
    id: '',
    name: '',
    password: '',
    token: '',
    type: '',
  );

  User get user => _user;

  void setUser(String user) {
    _user = User.fromJson(user);
    notifyListeners();
  }
}
