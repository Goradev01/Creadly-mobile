import 'package:creadlymobile/Model/Core/banklist.dart';
import 'package:creadlymobile/Model/Services/banklistapi.dart';
import 'package:dartz/dartz.dart';

class BankListHelper {
  final api = BankListApi();
  Future<Either<Exception, List<BankList>>> getBankLink() async {
    final apiResult = await api.getBankList();
    return apiResult.fold((l) => Left(l), (r) {
      List<BankList> data =
          List.generate(r.length, (index) => BankList.fromJson(r[index]));
      return Right(data);
    });
  }
}
