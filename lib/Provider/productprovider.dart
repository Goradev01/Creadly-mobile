import 'package:creadlymobile/Model/Helper/productapi.dart';
import 'package:flutter/material.dart';

import '../Model/Core/productdata.dart';

class ProductProvider extends ChangeNotifier {
  final helper = ProductHelper();

  Future<List<ProductData>> performMerchantQuery(String inputId) async {
    List<ProductData> data = [];
    await helper.getData().then((value) => value.fold((l) => null, (r) {
          Iterable<ProductData> query =
              r.where((element) => element.merchant['_id']!.contains(inputId));
          data = query.toList();

          notifyListeners();
        }));
    return data;
  }

  Future<List<ProductData>> getProductData() async {
    List<ProductData> data = [];
    await helper.getData().then((value) => value.fold((l) => null, (r) {
          data = r;
        }));

    return data;
  }

  Future<List<ProductData>> getHotDealData() async {
    List<ProductData> data = [];
    await helper.getHotDeal().then((value) => value.fold((l) => null, (r) {
          data = r;
        }));

    return data;
  }

  Future<List<ProductData>> performCategoryQuery(
    String inputId,
  ) async {
    List<ProductData> data = [];
    await helper
        .getProductCategory(inputId)
        .then((value) => value.fold((l) => print(l), (r) {
              data = r;

              // notifyListeners();
            }));

    return data;
  }

  Future<List<ProductData>> perProductData(
    String inputId,
  ) async {
    List<ProductData> data = [];
    await helper
        .getPerProduct(inputId)
        .then((value) => value.fold((l) => print(l), (r) {
              data = r;

              // notifyListeners();
            }));

    return data;
  }
}
