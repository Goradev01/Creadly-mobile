import 'package:creadlymobile/Model/Helper/productapi.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Model/Core/productdata.dart';
import 'merchantprovider.dart';

class ProductProvider extends ChangeNotifier {
  final helper = ProductHelper();

  List<ProductData> productQueryData = [];
  List<ProductData> productCategoryQueryData = [];
  void updateproductCategoryQueryData() {
    productCategoryQueryData = [];
    notifyListeners();
  }

  Future performQuery(String inputId, context, String merchantId) async {
    await Provider.of<MerchantProvider>(context, listen: false)
        .performQuery(merchantId);

    final result =
        helper.getData().then((value) => value.fold((l) => null, (r) {
              Iterable<ProductData> query =
                  r.where((element) => element.id!.contains(inputId));
              productQueryData = query.toList();
              String merchantName =
                  Provider.of<MerchantProvider>(context, listen: false)
                      .merchantQueryData[0]
                      .shopName!;
              productQueryData[0].merchant = merchantName;
              notifyListeners();
            }));
    return await result;
  }

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
}
