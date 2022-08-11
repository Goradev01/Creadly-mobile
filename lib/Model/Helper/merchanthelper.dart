import 'package:creadlymobile/Model/Core/merchantdata.dart';
import 'package:creadlymobile/Model/Services/merchantapi.dart';
import 'package:creadlymobile/Model/glitch.dart';
import 'package:creadlymobile/Model/nointernetglitch.dart';
import 'package:dartz/dartz.dart';

class MerchantHelper {
  final api = MerchantApi();
  Future<Either<Glitch, List<MerchantData>>> getdata() async {
    final apiResult = await api.merchantapi();
    return apiResult.fold((l) => Left(NoInternetGlitch()), (r) {
      List<MerchantData> data =
          List.generate(r.length, (index) => MerchantData.fromJson(r[index]));

      return Right(data);
    });
  }
}
