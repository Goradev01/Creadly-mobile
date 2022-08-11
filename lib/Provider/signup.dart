// import 'package:creadlymobile/Model/Core/Services/Helper/Configure/baseurl.dart';
import 'package:creadlymobile/Model/Helper/signuphelper.dart';
import 'package:flutter/material.dart';

import '../View/Auth/otp.dart';

class SignupProvider extends ChangeNotifier {
  bool loadsignup = false;

  void updateloadsignup(bool val) {
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

    final helper = SignUpHelper().postsignup(body).then((value) => {
          if (value.toString() == 'This email address already exists')
            {updateloadsignup(false)}
          else if (value.toString() == 'Bad Request')
            {
              // errorAlert('Error', context);
              updateloadsignup(false)
            }
          else
            {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return const Otp();
              }))
            }
        });
    return helper;
  }
}
