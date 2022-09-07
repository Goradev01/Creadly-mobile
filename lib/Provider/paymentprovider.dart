import 'package:creadlymobile/Model/Core/paymentdata.dart';
import 'package:flutter/material.dart';

import '../Model/Helper/paymenthelper.dart';

class PaymentProvider extends ChangeNotifier {
  final helper = PaymentHelper();
  Stream<List<PaymentData>> getPaymentData() async* {
    List<PaymentData> data = [];
    while (data.isEmpty) {
      await Future.delayed(const Duration(milliseconds: 500));
      await helper.getBankLink().then((value) => value.fold((l) => null, (r) {
            data = r;
          }));
      yield data;
    }
  }
}
