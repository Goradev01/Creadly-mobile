import 'package:creadlymobile/Model/Services/signupapi.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart';

class SignUpHelper {
  final api = SignUpAPi();

  Future<Either<Exception, Response>> postSignUp(Map body) async {
    final apiResult = await api.signup(body);
    return apiResult.fold((l) => Left(l), (r) => Right(r));
  }
}
