import 'package:creadlymobile/Model/Core/merchantdata.dart';
import 'package:creadlymobile/Model/Services/merchantapi.dart';
import 'package:creadlymobile/Model/errordisplay.dart';
import 'package:dartz/dartz.dart';

class MerchantHelper {
  final api = MerchantApi();
  Future<Either<ErrorDisplay, List<MerchantData>>> getdata() async {
    final apiResult = await api.merchantapi();
    return apiResult.fold((l) => const Left(ErrorDisplay()), (r) {
      List<MerchantData> data =
          List.generate(r.length, (index) => MerchantData.fromJson(r[index]));

      return Right(data);
    });
  }
}
