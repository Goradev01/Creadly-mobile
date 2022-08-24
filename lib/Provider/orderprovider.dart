import 'package:creadlymobile/Model/Core/orderdata.dart';
import 'package:flutter/cupertino.dart';

import '../Model/Helper/orderhelper.dart';
import 'login.dart';

class OrderProvider extends ChangeNotifier {
  final usertoken = LoginProvider().getUserToken();
  final helper = OrderHelper();
  List<OrderData> orderData = [];

  Future<List<OrderData>> getOrderData() async {
    List<OrderData> data = [];
    await usertoken.then((token) {
      return helper.getOrder(token.trim()).then((value) {
        value.fold((l) => null, (r) {
          data = r;

          // notifyListeners();
        });
      });
    });
    return data;
  }
}
