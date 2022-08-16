import 'package:camera/camera.dart';
import 'package:creadlymobile/Provider/login.dart';

import 'package:flutter/material.dart';

import '../Model/Helper/verifyselfiehelper.dart';

class VerifySelfieProvider extends ChangeNotifier {
  String idType = 'nin';
  String idNumber = '13324';
  XFile? imageFile;
  void updateImage(XFile image) {
    imageFile = image;
    notifyListeners();
  }

  void updateIdType(
    String idTypeInput,
  ) {
    idType = idTypeInput;
    // idNumber = idNumberInput;
    notifyListeners();
  }

  void updateIdNumber(String idNumberInput) {
    idNumber = idNumberInput;
    notifyListeners();
  }

  Future verifySelfie(
    XFile image,
  ) async {
    final usertoken = LoginProvider().getUserToken();
    final helper = VerifySelfieHelper();
    final postData = usertoken.then((token) {
      helper
          .postVerifySelfie(idType, idNumber, token.trim(), image)
          .then((value) {
        value.fold((l) {
          return l;
        }, (r) {
          return "Done";
        });
      });
    });
    return postData;
  }
}
