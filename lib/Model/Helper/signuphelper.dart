import 'package:creadlymobile/Model/Services/signupapi.dart';
import 'package:dartz/dartz.dart';

class SignUpHelper {
  final api = SignUpAPi();

  Future<Either<Exception, String>> postsignup(Map body) async {
    final apiResult = await api.signup(body);
    return apiResult.fold((l) => Left(l), (r) => Right(r));
  }
}
