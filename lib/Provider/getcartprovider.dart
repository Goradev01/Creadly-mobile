import 'package:creadlymobile/Model/Core/cartdata.dart';
import 'package:creadlymobile/Model/Helper/carthelper.dart';
import 'package:flutter/material.dart';

class GetCartProvider extends ChangeNotifier {
  int totalCost = 0;
  final helper = GetCartHelper();
  // void updateTotalCost() {
  //   getData().then((data) async {
  //     for (var i = 0; i == data.length; i++) {
  //       totalCost += data[i].price!;
  //     }
  //     notifyListeners();
  //   });
  // }

  Future<List<CartData>> getData() async {
    List<CartData> data = [];

    await helper.getData().then((value) => value.fold((l) => null, (r) {
          data = r;
        }));

    return data;
  }

  Future<int> totalAmount() async {
    int cost = 0;
    await helper.getData().then((value) => value.fold((l) => null, (r) {
          for (var i = 0; i < r.length; i++) {
            var sum = List.filled(r.length, r[i].price!);
            for (int e in sum) {
              cost += e;
            }

            return cost;
          }
        }));

    return cost;
  }
}
