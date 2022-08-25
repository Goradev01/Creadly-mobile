import 'package:creadlymobile/Model/Core/cartdata.dart';

import 'package:creadlymobile/Model/Services/getcartapi.dart';

import 'package:creadlymobile/Model/nointernetglitch.dart';
import 'package:dartz/dartz.dart';
import '../glitch.dart';

class GetCartHelper {
  final api = GetCart();
  Future<Either<Glitch, List<CartData>>> getData() async {
    final apiResult = await api.cartApi();
    return apiResult.fold((l) => Left(NoInternetGlitch()), (r) {
      List<CartData> data =
          List.generate(r.length, (index) => CartData.fromJson(r[index]));
      return Right(data);
    });
  }
}
