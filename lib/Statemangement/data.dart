import 'dart:convert';

import 'package:creadlymobile/Auth/otp.dart';
import 'package:creadlymobile/Onboarding/welcome.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../Onboarding/onboarding.dart';

class DataManagement extends ChangeNotifier {
  // Loading screen / auth checker
  String auth = '';
  bool loadlogin = false;
  bool loadsignup = false;
  void updateloadlogin(bool val) {
    loadlogin = val;

    notifyListeners();
  }

  void updateloadsignup(bool val) {
    loadsignup = val;

    notifyListeners();
  }

  void updateAuth(token) async {
    auth = token;
    final SharedPreferences pref = await SharedPreferences.getInstance();

    pref.setString('AuthToken', token);
//  Stream set u  => checkauth(token) ;
    notifyListeners();
  }

  Widget newuser = const Onboarding();
  void checkfirsttimer() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    bool firsttimer = pref.getBool('firsttimer')!;
    if (firsttimer == false) {
      newuser = const Welcome();
    }

    notifyListeners();
  }

  Future authlogin(String email, String password, context) async {
    Map body = {
      "email": email,
      "password": password,
    };
    try {
      final response = await http.post(
          Uri.parse(
            "https://credley-backend.herokuapp.com/api/v1/users/login",
          ),
          headers: {'Content-Type': 'application/json'},
          body: const JsonEncoder().convert(body));
//  print(response.body);
      if (response.body == 'Unauthorized') {
        errorAlert(response.body, context);
        updateloadlogin(false);
      } else if (response.body == 'Bad Request') {
        errorAlert('Error', context);
        updateloadlogin(false);
      } else {
        auth = response.body;
        final SharedPreferences pref = await SharedPreferences.getInstance();

        pref.setString('AuthToken', response.body);

        // errorAlert('on data');
      }
    } catch (e) {
      errorAlert('error', context);
      updateloadlogin(false);
    }
    notifyListeners();
  }

  Future authsignup(
      String email, String phonenumber, String password, context) async {
    Map body = {
      "phoneNumber": phonenumber,
      "email": email,
      "password": password,
    };
    try {
      final response = await http.post(
          Uri.parse(
            "https://credley-backend.herokuapp.com/api/v1/users",
          ),
          headers: {'Content-Type': 'application/json'},
          body: const JsonEncoder().convert(body));
      // print(response.body);
      if (response.body == 'This email address already exists') {
        errorAlert(response.body, context);
        updateloadsignup(false);
      } else if (response.body == 'Bad Request') {
        errorAlert('Error', context);
        updateloadsignup(false);
      } else {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return const Otp();
        }));
        // setData(response.body);
        // errorAlert('on dat,contexta');
      }
    } catch (e) {
      errorAlert('error', context);
      updateloadsignup(false);
    }
  }

  void errorAlert(response, context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Text(response),
            actions: [
              TextButton(
                  onPressed: () {
                    //DeleteProduct(Image, Category, Id)

                    Navigator.pop(context);
                  },
                  child: const Text('back')),
            ],
          );
        });
  }
}
