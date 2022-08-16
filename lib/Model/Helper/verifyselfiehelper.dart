import 'package:camera/camera.dart';
import 'package:creadlymobile/Model/Services/verifyselfie.dart';
import 'package:dartz/dartz.dart';

class VerifySelfieHelper {
  final api = VerifySelfieApi();
  Future<Either<Exception, String>> postVerifySelfie(
      String type, String pin, String usertoken, XFile file) async {
    final apiResult = await api.verifySelfie(type, pin, usertoken, file);
    return apiResult.fold((l) => Left(l), (r) => Right(r));
  }
}
