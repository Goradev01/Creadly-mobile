import 'package:creadlymobile/Model/Core/paymentdata.dart';
import 'package:dartz/dartz.dart';

import '../Services/paymentapi.dart';

class PaymentHelper {
  final api = PaymentApi();
  Future<Either<Exception, List<PaymentData>>> getBankLink() async {
    final apiResult = await api.paymentApi();
    return apiResult.fold((l) => Left(l), (r) {
      List<PaymentData> data =
          List.generate(r.length, (index) => PaymentData.fromJson(r[index]));
      return Right(data);
    });
  }
}
