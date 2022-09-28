import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:proj/models/user_model.dart';
import 'package:proj/utils/app_utils.dart';

import '../profile.dart';

class ApiServices {
  //user login

  Future<void> createAccount(
      String name, String job, BuildContext context) async {
    try {
      final response =
          await http.post(Uri.parse("https://reqres.in/api/users"), body: {
        "name": name,
        "job": job,
      });

      if (response.statusCode == 201) {
        var data = jsonDecode(response.body.toString());
        if (kDebugMode) {
          print(data);
          print("Account created Successfully");
        }
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            backgroundColor: Colors.green, content: Text("Successfully")));
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const Profile()));
      }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }

      AppUtils().showErrorToastMessage(e.toString());
    }
  }

  //fetch user data
  Future<UserModel> fetchUserData() async {
    Response response =
        await http.get(Uri.parse("https://reqres.in/api/users"));
    var data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return UserModel.fromJson(data);
    } else {
      if (kDebugMode) {
        print("Error");
        AppUtils().showErrorToastMessage("something went wrong");
      }
    }
    return UserModel.fromJson(data);
  }
}
