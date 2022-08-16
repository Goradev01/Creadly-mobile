import 'package:creadlymobile/Model/Helper/productapi.dart';
import 'package:creadlymobile/Provider/merchantprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Model/Core/productdata.dart';

class ProductProvider extends ChangeNotifier {
  final helper = ProductHelper();
  List<ProductData> productData = [];
  List<ProductData> productQueryData = [];

  Future performQuery(String inputId, context, merchantId) async {
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

  Future getProductData() async {
    final result =
        helper.getData().then((value) => value.fold((l) => print(l), (r) {
              productData = r;
              notifyListeners();
            }));

    return result;
  }
}
