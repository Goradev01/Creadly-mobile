import 'package:camera/camera.dart';
import 'package:creadlymobile/Model/Helper/verifyidhelper.dart';
import 'package:creadlymobile/Provider/login.dart';
import 'package:flutter/material.dart';

import '../View/Auth/idcomplete.dart';

class VerifyIdProvider extends ChangeNotifier {
  final usertoken = LoginProvider().getUserToken();

  Future verifyId(
    String idType,
    String idNumber,
    XFile file,
    context,
  ) async {
    final helper = VerifyIdHelper();
    final postData = usertoken.then((token) {
      return helper
          .postVerifyId(idType, idNumber, token.trim(), file)
          .then((value) {
        value.fold((l) {
          if (l.toString() == 'Invaild Token') {
            return (l.toString());
          }
        }, (r) {
          // print(r);
          if (r.toString() == '200') {
            // print(r);
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const Idcompleted()),
            );
          }
        });
      });
    });
    return postData;
  }
}
