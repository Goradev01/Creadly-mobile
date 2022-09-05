import 'package:creadlymobile/Model/Core/categorydata.dart';
import 'package:creadlymobile/Model/Services/categoryapi.dart';
import 'package:creadlymobile/Model/errordisplay.dart';
import 'package:dartz/dartz.dart';

class CategoryHelper {
  final api = CategoryAPi();
  Future<Either<ErrorDisplay, List<CategoryData>>> getData() async {
    final apiResult = await api.categoryApi();
    return apiResult.fold((l) {
      return const Left(ErrorDisplay());
    }, (r) {
      List<CategoryData> data =
          List.generate(r.length, (index) => CategoryData.fromJson(r[index]));

      return Right(data);
    });
  }
}
