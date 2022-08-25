import 'package:creadlymobile/Model/Services/loginapi.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart';

class LoginHelper {
  final api = LoginApi();

  Future<Either<Exception, Response>> postLogin(Map body) async {
    final apiResult = await api.login(body);
    return apiResult.fold((l) => Left(l), (r) => Right(r));
  }
}
