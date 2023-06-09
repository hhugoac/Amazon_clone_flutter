import 'dart:convert';

import 'package:ecommerce_clone/constants/error_handling.dart';
import 'package:ecommerce_clone/constants/global_variables.dart';
import 'package:ecommerce_clone/constants/utils.dart';
import 'package:ecommerce_clone/home/screen/home_screen.dart';
import 'package:ecommerce_clone/model/user.dart';
import 'package:ecommerce_clone/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  void signUpUser({
    required BuildContext context,
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      User user = User(
          id: '',
          name: name,
          password: password,
          email: email,
          address: '',
          type: '',
          token: '');

      http.Response res = await http.post(
        Uri.parse('$uri/api/signup'),
        body: user.toJson(),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      // ignore: use_build_context_synchronously
      httpErrorHandling(
          response: res,
          context: context,
          onSuccess: () {
            showSnakcBar(context, 'Account created successful, login with it');
          });
    } catch (e) {
      print(e.toString());
      showSnakcBar(context, e.toString());
    }
  }

  //sign in user
  void signInUser({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      http.Response res = await http.post(
        Uri.parse('$uri/api/signin'),
        body: jsonEncode({
          'email': email,
          'password': password,
        }),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      print(res.body);
      // ignore: use_build_context_synchronously
      httpErrorHandling(
          response: res,
          context: context,
          onSuccess: () async {
            SharedPreferences pref = await SharedPreferences.getInstance();
            Provider.of<UserProvider>(context, listen: false).setUser(res.body);
            pref.setString('x-auth-token', jsonDecode(res.body)['token']);
            Navigator.pushNamedAndRemoveUntil(
              context,
              HomeScreen.routeName,
              (route) => false,
            );
          });
    } catch (e) {
      print(e.toString());
      showSnakcBar(context, e.toString());
    }
  }
}