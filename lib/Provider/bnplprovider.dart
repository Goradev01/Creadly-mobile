import 'package:creadlymobile/Model/Core/bnlp.dart';
import 'package:creadlymobile/Model/Helper/bnplhelper.dart';
import 'package:flutter/material.dart';

class BnplProvider extends ChangeNotifier {
  final helper = GetBnplHelper();
  Future<List<BnplData>> getData() async {
    List<BnplData> data = [];

    await helper.getData().then((value) => value.fold((l) => null, (r) {
          data = r;
        }));
    return data;
  }
}
