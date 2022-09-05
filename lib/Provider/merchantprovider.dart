import 'package:creadlymobile/Model/Core/merchantdata.dart';
import 'package:creadlymobile/Model/Helper/merchanthelper.dart';
import 'package:creadlymobile/Model/errordisplay.dart';
import 'package:flutter/cupertino.dart';

class MerchantProvider extends ChangeNotifier {
  final helper = MerchantHelper();
  // List<MerchantData> merchantdata = [];
  // List<MerchantData> merchantQueryData = [];
  Future<List<MerchantData>> performQuery(String merchantId) async {
    List<MerchantData> merchantData = [];

    await helper.getdata().then((value) => value.fold((l) => null, (r) {
          Iterable<MerchantData> query =
              r.where((element) => element.id!.contains(merchantId));
          // merchantQueryData = query.toList();
          merchantData = query.toList();
          //  merchantQueryData[0].
        }));
    return merchantData;
  }

  Future<List<MerchantData>> getMerchantData() async {
    List<MerchantData> merchantData = [];
    await helper.getdata().then((value) =>
        value.fold((l) => const ErrorDisplay(), (r) => {merchantData = r}));

    return merchantData;
  }
}
