import 'package:creadlymobile/Model/Core/withdraw.dart';
import 'package:flutter/material.dart';

import '../Model/Helper/widthdrawhelper.dart';
import '../Model/errordisplay.dart';

class WithdrawProvider extends ChangeNotifier {
  final helper = WithdrawHelper();
  bool loadingProgess = false;
  void updateLoadingProgess(bool val) {
    loadingProgess = val;

    notifyListeners();
  }

  Stream<List<WithdrawData>> getWithdrawPerData(String id) async* {
    List<WithdrawData> data = [];
    while (data.isEmpty) {
      await Future.delayed(const Duration(milliseconds: 500));
      await helper.getPerData(id).then((value) => value.fold((l) => null, (r) {
            data = r;
          }));
      yield data;
    }
  }

  Stream<List<WithdrawData>> getWithdrawData() async* {
    List<WithdrawData> data = [];
    while (data.isEmpty) {
      await Future.delayed(const Duration(milliseconds: 500));
      await helper.getData().then((value) => value.fold((l) => null, (r) {
            print(r[0].amount);
            data = r;
          }));
      yield data;
    }
  }

  Future postWithdraw(Map body) async {
    final result = helper
        .postData(
      body,
    )
        .then((value) {
      value.fold((l) => const ErrorDisplay(), (r) {
        if (r.statusCode == 200) {
          updateLoadingProgess(false);
        } else {
          return const ErrorDisplay();
        }
      });
    });
    return result;
  }
}
