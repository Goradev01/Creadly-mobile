import 'package:creadlymobile/Model/Core/banklist.dart';
import 'package:creadlymobile/Model/Helper/bankhelper.dart';
import 'package:creadlymobile/Model/Helper/banklisthelper.dart';
import 'package:creadlymobile/Model/errordisplay.dart';
import 'package:flutter/material.dart';

class BankProvider extends ChangeNotifier {
  final helper = BankHelper();
  bool loading = false;
  List<DropdownMenuItem<String>>? bankOption;

  void updateLoading(bool val) {
    loading = val;

    notifyListeners();
  }

  Stream<List<BankList>> getbankList() async* {
    final bankhelp = BankListHelper();
    List<BankList> data = [];
    while (data.isEmpty) {
      await Future.delayed(const Duration(milliseconds: 500));
      await bankhelp.getBankLink().then((value) => value.fold((l) => null, (r) {
            data = r;
          }));
      yield data;
    }
  }

  Future<List<BankList>> getBankList() async {
    List<BankList> data = [];
    final bankhelp = BankListHelper();
    await bankhelp.getBankLink().then((value) => value.fold((l) => null, (r) {
          data = r;
          print(r);
          // bankOption = List.generate(
          //   r.length,
          //   (index) => DropdownMenuItem<dynamic>(
          //       value: r[index].name, child: const Text('lagosAgege')),
          // );
        }));
    // notifyListeners();
    return data;
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

  Future verifyBank(Map verifyBody, Map body) async {
    final result = helper
        .postBank(
      verifyBody,
    )
        .then((value) {
      value.fold((l) => const ErrorDisplay(), (r) {
        if (r.statusCode == 200) {
          addBank(body);
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
