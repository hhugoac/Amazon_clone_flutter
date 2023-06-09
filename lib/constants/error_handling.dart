import 'dart:convert';

import 'package:ecommerce_clone/constants/utils.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void httpErrorHandling({
  required http.Response response,
  required BuildContext context,
  required VoidCallback onSuccess,
}) {
  switch (response.statusCode) {
    case 200:
      onSuccess();
      break;
    case 400:
      showSnakcBar(context, jsonDecode(response.body)['msg']);
      print(response.body.toString());
      break;
    case 500:
      showSnakcBar(context, jsonDecode(response.body)['error']);
      print(response.body.toString());
      break;
    default:
      showSnakcBar(context, jsonDecode(response.body));
      print(response.body.toString());
      break;
  }
}
