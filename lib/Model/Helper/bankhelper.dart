import 'package:creadlymobile/Model/Services/bankapi.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart';

class BankHelper {
  final api = BankApi();
  Future<Either<Exception, Response>> postBank(Map body) async {
    final apiResult = await api.addBankData(body);
    return apiResult.fold((l) => Left(l), (r) => Right(r));
  }

  Future<Either<Exception, Response>> removeBank(String id) async {
    final apiResult = await api.removeBank(id);
    return apiResult.fold((l) => Left(l), (r) => Right(r));
  }

  Future<Either<Exception, Response>> defaultBank(String id) async {
    final apiResult = await api.defaultBank(id);
    return apiResult.fold((l) => Left(l), (r) => Right(r));
  }
}
