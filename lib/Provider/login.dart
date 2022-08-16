import 'package:creadlymobile/Model/Helper/loginhelper.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// import '../Model/Core/Services/Helper/Configure/baseurl.dart';
import '../View/Onboarding/onboarding.dart';
import '../View/Onboarding/welcome.dart';

class LoginProvider extends ChangeNotifier {
  Widget newuser = const Onboarding();
  void checkfirsttimer() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    bool firsttimer = pref.getBool('firsttimer')!;
    if (firsttimer == false) {
      newuser = const Welcome();
    }

    notifyListeners();
  }

  Future<String> getUserToken() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    String usertoken = pref.getString('AuthToken')!;
    return usertoken;
  }

  String auth = '';
  bool loadlogin = false;
  void updateLoadLogin(bool val) {
    loadlogin = val;

    notifyListeners();
  }

  void updateAuth(token) async {
    auth = token;
    final SharedPreferences pref = await SharedPreferences.getInstance();

    pref.setString('AuthToken', token);
//  Stream set u  => checkauth(token) ;
    notifyListeners();
  }

  Future authLogin(String email, String password, context) async {
    Map body = {
      "email": email,
      "password": password,
    };
    final helper = LoginHelper().postLogin(body).then((value) async {
      value.fold((l) {
        if (l.toString() == 'Unauthorized') {
          // errorAlert(value, context);
          updateLoadLogin(false);
        } else if (l.toString() == 'Bad Request') {
          // errorAlert('Error', context);
          updateLoadLogin(false);
        } else {
          updateLoadLogin(false);
        }
      }, (r) async {
        auth = r.toString();
        final SharedPreferences pref = await SharedPreferences.getInstance();

        pref.setString('AuthToken', r.toString());

        // errorAlert('on data');
      });

      notifyListeners();
    });
    return helper;

//     try {
//       final response = await http.post(
//           Uri.parse(
//             "$baseurl/users/login",
//           ),
//           headers: {'Content-Type': 'application/json'},
//           body: const JsonEncoder().convert(body));
// //  print(response.body);

//     } catch (e) {
//       // errorAlert('error', context);
//       updateLoadLogin(false);
//     }
  }
}
