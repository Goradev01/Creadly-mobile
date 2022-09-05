import 'package:creadlymobile/Model/Core/wishlist.dart';
import 'package:creadlymobile/Model/Helper/wishlisthelper.dart';
import 'package:flutter/material.dart';

class WishListProvider extends ChangeNotifier {
  int totalCost = 0;
  final helper = WishListHelper();
  bool loadingRemoveWishList = false;
  void updateTotalCost(int val) {
    totalCost = val;
    notifyListeners();
  }

  void updateRemove(bool val) {
    loadingRemoveWishList = val;

    notifyListeners();
  }

  Future removeCart(String id) async {
    helper.removeWishList(id).then((value) {
      value.fold((l) => null, (r) {
        if (r.statusCode == 200) {
          updateRemove(false);
          print('remove');
        }
      });
    });
  }

  Future<List<WishListData>> getData() async {
    List<WishListData> data = [];

    await helper.getData().then((value) => value.fold((l) => null, (r) {
          data = r;
        }));

    return data;
  }
}
