import 'dart:async';

import 'package:creadlymobile/Model/Core/categorydata.dart';
import 'package:creadlymobile/Model/Helper/categoryhelper.dart';
import 'package:flutter/material.dart';

class CategoryProvider extends ChangeNotifier {
  final helper = CategoryHelper();
  List<CategoryData> categorydata = [];

  Future getCategoryData() async {
    final res =
        helper.getdata().then((value) => value.fold((l) => print(l), (r) {
              categorydata = r;
              notifyListeners();
            }));
    return res;
  }
}
