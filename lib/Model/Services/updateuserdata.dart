import 'dart:convert';

// import 'package:creadlymobile/Model/Core/Services/Helper/Configure/baseurl.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

import '../Configure/baseurl.dart';

class UpdateUserData {
  String endpoint = '${Baseurl().url}/api/v1/users/update-profile';

  Future<Either<Exception, dynamic>> updateUserData(
      Map body, String usertoken) async {
    try {
      final response = await http.post(
          Uri.parse(
            endpoint,
          ),
          headers: {
            'Content-Type': 'application/json',
            "authorization": usertoken
          },
          body: const JsonEncoder().convert(body));

      return Right(response.statusCode);
    } on Exception catch (e) {
      return Left(e);
    }
  }
}
