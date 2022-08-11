import 'package:creadlymobile/Model/Core/merchantdata.dart';
import 'package:creadlymobile/Model/Helper/merchanthelper.dart';
import 'package:flutter/cupertino.dart';

class MerchantProvider extends ChangeNotifier {
  final helper = MerchantHelper();
  List<MerchantData> merchantdata = [];

  Future<void> getMerchantData() async {
    await helper
        .getdata()
        .then((value) => value.fold((l) => null, (r) => {merchantdata = r}));
    notifyListeners();
  }
}
