import 'package:creadlymobile/Model/Core/categorydata.dart';
import 'package:creadlymobile/Model/Services/categoryapi.dart';
import 'package:creadlymobile/Model/glitch.dart';
import 'package:creadlymobile/Model/nointernetglitch.dart';
import 'package:dartz/dartz.dart';

class CategoryHelper {
  final api = CategoryAPi();
  Future<Either<Glitch, List<CategoryData>>> getdata() async {
    final apiResult = await api.categoryapi();
    return apiResult.fold((l) {
      return Left(NoInternetGlitch());
    }, (r) {
      // print(r.length);
      // List h = r.map((i) {
      //   Map<String, dynamic> data = i as Map<String, dynamic>;
      // });
      // print(h[1]);
      List<CategoryData> data =
          List.generate(r.length, (index) => CategoryData.fromJson(r[index]));
      // print(das[0].imageUrl);
      // final data = CategoryData.fromJson(r[0]);

      return Right(data);

      //  final data = CategoryData.fromMap(r[0].asMap());
    });
  }
}
