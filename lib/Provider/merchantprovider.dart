import 'package:creadlymobile/Model/Core/merchantdata.dart';
import 'package:creadlymobile/Model/Helper/merchanthelper.dart';
import 'package:flutter/cupertino.dart';

class MerchantProvider extends ChangeNotifier {
  final helper = MerchantHelper();
  List<MerchantData> merchantdata = [];
  List<MerchantData> merchantQueryData = [];
  Future performQuery(String merchantId) async {
    final result =
        helper.getdata().then((value) => value.fold((l) => null, (r) {
              Iterable<MerchantData> query =
                  r.where((element) => element.id!.contains(merchantId));
              merchantQueryData = query.toList();
              //  merchantQueryData[0].
              notifyListeners();
            }));
    return result;
  }

  Future<void> getMerchantData() async {
    await helper
        .getdata()
        .then((value) => value.fold((l) => null, (r) => {merchantdata = r}));
    notifyListeners();
  }
}
