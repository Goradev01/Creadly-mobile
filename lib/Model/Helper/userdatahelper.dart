import 'package:creadlymobile/Model/Core/userdata.dart';
import 'package:creadlymobile/Model/Services/userdataapi.dart';
import 'package:creadlymobile/Model/nointernetglitch.dart';
import 'package:dartz/dartz.dart';

import '../glitch.dart';

class UserDataHelper {
  final api = UserDataApi();
  Future<Either<Glitch, List<UserData>>> getData(String usertoken) async {
    final apiResult = await api.userDataApi(usertoken);
    return apiResult.fold((l) => Left(NoInternetGlitch()), (r) {
      List<UserData> data =
          List.generate(1, (index) => UserData.fromJson(r[index]));

      return Right(data);
    });
  }
}
