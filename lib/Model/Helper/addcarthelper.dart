import 'package:creadlymobile/Model/Services/cartapi.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart';

class AddCartHelper {
  final api = AddCartApi();

  Future<Either<Exception, dynamic>> postCart(
      Map body, String usertoken) async {
    final apiResult = await api.addCartApi(body, usertoken);
    return apiResult.fold((l) => Left(l), (r) => Right(r));
  }

  Future<Either<Exception, Response>> removeCart(String productId) async {
    final apiResult = await api.removeCartApi(productId);
    return apiResult.fold((l) => Left(l), (r) => Right(r));
  }
}
