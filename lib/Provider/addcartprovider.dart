import 'package:creadlymobile/Model/Helper/addcarthelper.dart';
import 'package:creadlymobile/Provider/login.dart';
import 'package:creadlymobile/View/TabComponent/Shop/cart.dart';
import 'package:flutter/material.dart';

class AddCartProvider extends ChangeNotifier {
  final usertoken = LoginProvider().getUserToken();

  Future addCart(String id, context) async {
    final helper = AddCartHelper();
    Map body = {"productId": id};
    final postData = usertoken.then((token) {
      return helper.postCart(body, token).then((value) {
        value.fold((l) => null, (r) {
          print(r);
          if (r.toString() == '200') {
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
