import 'package:creadlymobile/Model/Core/categorydata.dart';
import 'package:creadlymobile/Model/Services/categoryapi.dart';
import 'package:creadlymobile/Model/glitch.dart';
import 'package:creadlymobile/Model/nointernetglitch.dart';
import 'package:dartz/dartz.dart';

class CategoryHelper {
  final api = CategoryAPi();
  Future<Either<Glitch, List<CategoryData>>> getData() async {
    final apiResult = await api.categoryApi();
    return apiResult.fold((l) {
      return Left(NoInternetGlitch());
    }, (r) {
      List<CategoryData> data =
          List.generate(r.length, (index) => CategoryData.fromJson(r[index]));

      return Right(data);
    });
  }
}
