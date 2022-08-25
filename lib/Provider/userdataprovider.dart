import 'package:creadlymobile/Model/Core/userdata.dart';
import 'package:creadlymobile/Model/Helper/updateuserdatehelper.dart';
import 'package:creadlymobile/Model/Helper/userdatahelper.dart';
import 'package:creadlymobile/Provider/login.dart';
import 'package:flutter/cupertino.dart';

class UserDataProvider extends ChangeNotifier {
  final helper = UserDataHelper();
  final updateHelper = UpdateUserHelper();
  String email = '';
  String firstName = '';
  String phoneNumber = '';
  final usertoken = LoginProvider().getUserToken();
  bool loadingProgress = true;
  void updateLoadingProgress(bool val) {
    loadingProgress = val;

    notifyListeners();
  }

  void updateDetail(String input, dynamic name, String phoneNo) {
    email = input;
    if (name != null) {
      firstName = name;
    }

    phoneNumber = phoneNo;
    notifyListeners();
  }

  Future<List<UserData>> getUserData() async {
    List<UserData> data = [];
    await usertoken.then((token) {
      return helper.getData(token.trim()).then((value) {
        value.fold((l) => null, (r) {
          data = r;
        });
      });
    });

    return data;
  }

  Future updateDate(
    Map body,
  ) async {
    await usertoken.then((token) {
      return updateHelper.updateData(body, token).then((value) {
        value.fold((l) => null, (r) {
          if (r.toString() == '200') {
            updateLoadingProgress(true);
            // print(r);
            // Navigator.of(context).push(
            //   MaterialPageRoute(builder: (context) => const Idcompleted()),
            // );
          }
          // notifyListeners();
        });
      });
    });
  }
}
