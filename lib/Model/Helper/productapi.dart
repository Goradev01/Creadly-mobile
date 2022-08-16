import 'package:creadlymobile/Model/Core/productdata.dart';
import 'package:creadlymobile/Model/Services/productapi.dart';
import 'package:creadlymobile/Model/nointernetglitch.dart';
import 'package:dartz/dartz.dart';

import '../glitch.dart';

class ProductHelper {
  final api = ProductApi();
  Future<Either<Glitch, List<ProductData>>> getData() async {
    final apiResult = await api.productApi();
    return apiResult.fold((l) => Left(NoInternetGlitch()), (r) {
      List<ProductData> data =
          List.generate(r.length, (index) => ProductData.fromJson(r[index]));
      return Right(data);
    });
  }
}
