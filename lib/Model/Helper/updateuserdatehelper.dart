import 'package:creadlymobile/Model/Services/updateuserdata.dart';
import 'package:dartz/dartz.dart';

class UpdateUserHelper {
  final api = UpdateUserData();

  Future<Either<Exception, dynamic>> updateData(Map body, String token) async {
    final apiResult = await api.updateUserData(body, token);
    return apiResult.fold((l) => Left(l), (r) => Right(r));
  }
}
