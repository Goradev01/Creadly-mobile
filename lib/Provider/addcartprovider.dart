import 'package:creadlymobile/Model/Helper/addcarthelper.dart';
import 'package:creadlymobile/Provider/login.dart';
import 'package:creadlymobile/View/TabComponent/Shop/cart.dart';
import 'package:flutter/material.dart';

class AddCartProvider extends ChangeNotifier {
  final usertoken = LoginProvider().getUserToken();
  bool loadingAddCart = false;
  void updateLoadingCart(bool val) {
    loadingAddCart = val;

    notifyListeners();
  }

  Future addCart(String id, context) async {
    final helper = AddCartHelper();
    Map body = {"productId": id};
    final postData = usertoken.then((token) {
      return helper.postCart(body, token).then((value) {
        value.fold((l) => null, (r) {
          if (r.toString() == '200') {
            updateLoadingCart(false);
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const Cart()),
            );
          }
        });
      });
    });
    return postData;
  }
}
