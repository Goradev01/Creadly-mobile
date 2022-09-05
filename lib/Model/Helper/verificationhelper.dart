import 'package:creadlymobile/Model/Services/verification.dart';
import 'package:creadlymobile/Model/glitch.dart';
import 'package:creadlymobile/Model/nointernetglitch.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart';

class VerificationHelper {
  final api = VerificationApi();
  Future<Either<Glitch, Response>> getToken(String token) async {
    final apiResult = await api.verifyOtp(token);
    return apiResult.fold((l) => Left(NoInternetGlitch()), (r) => Right(r));
  }
}
