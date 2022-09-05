import 'dart:async';

import 'package:creadlymobile/Model/Core/categorydata.dart';
import 'package:creadlymobile/Model/Helper/categoryhelper.dart';
import 'package:creadlymobile/Model/errordisplay.dart';
import 'package:flutter/material.dart';

class CategoryProvider extends ChangeNotifier {
  final helper = CategoryHelper();

  Future<List<CategoryData>> getCategoryData() async {
    List<CategoryData> categorydata = [];

    // ignore: avoid_print
    await helper.getData().then((value) => value.fold((l) => null, (r) {
          categorydata = r;
        }));
    return categorydata;
  }

  Stream<List<CategoryData>> getData() async* {
    List<CategoryData> categorydata = [];
    while (categorydata.isEmpty) {
      await Future.delayed(const Duration(milliseconds: 500));
      await helper
          .getData()
          .then((value) => value.fold((l) => const ErrorDisplay(), (r) {
                categorydata = r;
              }));
      //  print(categorydata);
      yield categorydata;
    }
  }
}
