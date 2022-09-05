import 'package:creadlymobile/Model/Helper/bankhelper.dart';
import 'package:creadlymobile/Model/errordisplay.dart';
import 'package:flutter/material.dart';

class BankProvider extends ChangeNotifier {
  final helper = BankHelper();
  bool loading = false;

  void updateLoading(bool val) {
    loading = val;

    notifyListeners();
  }

  Future addBank(Map body) async {
    final result = helper
        .postBank(
      body,
    )
        .then((value) {
      value.fold((l) => const ErrorDisplay(), (r) {
        if (r.statusCode == 200) {
        } else {
          return const ErrorDisplay();
        }
      });
    });
    return result;
  }

  Future removeBank(String id) async {
    final result = helper
        .removeBank(
      id,
    )
        .then((value) {
      value.fold((l) => const ErrorDisplay(), (r) {
        if (r.statusCode == 200) {
        } else {
          return const ErrorDisplay();
        }
      });
    });
    return result;
  }

  Future defaultBank(String id) async {
    final result = helper
        .defaultBank(
      id,
    )
        .then((value) {
      value.fold((l) => const ErrorDisplay(), (r) {
        if (r.statusCode == 200) {
        } else {
          return const ErrorDisplay();
        }
      });
    });
    return result;
  }
}
