import 'package:camera/camera.dart';
import 'package:creadlymobile/Model/Services/verifyidentity.dart';
import 'package:dartz/dartz.dart';

class VerifyIdHelper {
  final api = VerifyIdentityApi();
  Future<Either<Exception, String>> postVerifyId(
      String type, String pin, String usertoken, XFile image) async {
    final apiResult = await api.verifyId(type, pin, usertoken, image);
    return apiResult.fold((l) => Left(l), (r) => Right(r));
  }
}
