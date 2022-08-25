import 'package:creadlymobile/Model/Services/cartaoi.dart';
import 'package:dartz/dartz.dart';

class AddCartHelper {
  final api = AddCartApi();

  Future<Either<Exception, dynamic>> postCart(
      Map body, String usertoken) async {
    final apiResult = await api.addCartApi(body, usertoken);
    return apiResult.fold((l) => Left(l), (r) => Right(r));
  }
}
