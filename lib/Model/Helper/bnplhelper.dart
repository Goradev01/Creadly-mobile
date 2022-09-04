import 'package:creadlymobile/Model/Core/bnlp.dart';
import 'package:creadlymobile/Model/Services/bnplapi.dart';
import 'package:creadlymobile/Model/glitch.dart';
import 'package:creadlymobile/Model/nointernetglitch.dart';
import 'package:dartz/dartz.dart';

class GetBnplHelper {
  final api = BnplApi();

  Future<Either<Glitch, List<BnplData>>> getData() async {
    final apiResult = await api.bnplApi();
    return apiResult.fold((l) => Left(NoInternetGlitch()), (r) {
      List<BnplData> data =
          List.generate(r.length, (index) => BnplData.fromJson(r[index]));
      return Right(data);
    });
  }
}
