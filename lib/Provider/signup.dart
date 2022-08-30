// import 'package:creadlymobile/Model/Core/Services/Helper/Configure/baseurl.dart';
import 'package:creadlymobile/Model/Helper/signuphelper.dart';
import 'package:flutter/material.dart';

import '../View/Auth/otp.dart';

class SignupProvider extends ChangeNotifier {
  bool loadsignup = false;

  void updateLoadSignup(bool val) {
    loadsignup = val;

    notifyListeners();
  }

  Future authSignUp(
      String email, String phonenumber, String password, context) async {
    Map body = {
      "phoneNumber": phonenumber,
      "email": email,
      "password": password,
    };

    final helper = SignUpHelper().postSignUp(body).then((value) => {
          value.fold((l) => null, (r) {
            if (r.statusCode == 200) {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return const Otp();
              }));
            } else {
              return 'Error';
            }
          })
        });
    return helper;
  }
}
