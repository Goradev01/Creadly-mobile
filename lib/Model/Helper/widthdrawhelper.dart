import 'package:creadlymobile/Model/Core/withdraw.dart';
import 'package:creadlymobile/Model/Services/withdrawapi.dart';
import 'package:creadlymobile/Model/nointernetglitch.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart';

import '../glitch.dart';

class WithdrawHelper {
  final api = WithdrawApi();

  Future<Either<Glitch, List<WithdrawData>>> getPerData(String id) async {
    final apiResult = await api.withdrawPerApi(id);
    return apiResult.fold((l) => Left(NoInternetGlitch()), (r) {
      List<WithdrawData> data =
          List.generate(r.length, (index) => WithdrawData.fromJson(r[index]));
      return Right(data);
    });
  }

  Future<Either<Glitch, List<WithdrawData>>> getData() async {
    final apiResult = await api.withdrawApi();
    return apiResult.fold((l) => Left(NoInternetGlitch()), (r) {
      List<WithdrawData> data =
          List.generate(r.length, (index) => WithdrawData.fromJson(r[index]));
      print(data);
      return Right(data);
    });
  }

  Future<Either<Glitch, Response>> postData(Map body) async {
    final apiResult = await api.postWithdraw(body);
    return apiResult.fold((l) => Left(NoInternetGlitch()), (r) {
      return Right(r);
    });
  }
}
