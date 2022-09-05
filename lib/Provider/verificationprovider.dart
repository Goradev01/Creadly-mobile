import 'package:creadlymobile/Model/Helper/verificationhelper.dart';
import 'package:flutter/material.dart';

import '../View/Auth/login.dart';

class VerificationProvider extends ChangeNotifier {
  bool progress = false;
  final helper = VerificationHelper();
  void updateprogress(bool val) {
    progress = val;

    notifyListeners();
  }

  Future verify(String id, context) async {
    helper.getToken(id).then((value) {
      value.fold((l) => null, (r) {
        if (r.statusCode == 200) {
          updateprogress(false);
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return const Login();
          }));
        }
      });
    });
  }
}
