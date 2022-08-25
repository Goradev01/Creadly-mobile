import 'package:creadlymobile/Model/Core/wishlist.dart';
import 'package:creadlymobile/Model/Helper/wishlisthelper.dart';
import 'package:flutter/material.dart';

class WishListProvider extends ChangeNotifier {
  int totalCost = 0;
  final helper = WishListHelper();
  void updateTotalCost(int val) {
    totalCost = val;
    notifyListeners();
  }

  Future<List<WishListData>> getData() async {
    List<WishListData> data = [];

    await helper.getData().then((value) => value.fold((l) => null, (r) {
          data = r;
        }));

    return data;
  }
}
