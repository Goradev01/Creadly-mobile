import 'package:creadlymobile/Model/Helper/addcarthelper.dart';
import 'package:creadlymobile/Model/errordisplay.dart';
import 'package:creadlymobile/Provider/login.dart';
import 'package:creadlymobile/View/TabComponent/Shop/cart.dart';
import 'package:flutter/material.dart';

class AddCartProvider extends ChangeNotifier {
  final usertoken = LoginProvider().getUserToken();
  final helper = AddCartHelper();
  bool loadingAddCart = false;
  bool loadingRemoveCart = false;
  void updateLoadingCart(bool val) {
    loadingAddCart = val;

    notifyListeners();
  }

  void updateLoadingRemoveCart(bool val) {
    loadingRemoveCart = val;

    notifyListeners();
  }

  Future removeCart(String id) async {
    helper.removeCart(id).then((value) {
      value.fold((l) => const ErrorDisplay(), (r) {
        if (r.statusCode == 200) {
          updateLoadingRemoveCart(false);
        } else {
          const ErrorDisplay();
        }
      });
    });
  }

  Future addCart(String id, context) async {
    Map body = {"productId": id};
    final postData = usertoken.then((token) {
      return helper.postCart(body, token).then((value) {
        value.fold((l) => const ErrorDisplay(), (r) {
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
