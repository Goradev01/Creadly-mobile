import 'dart:convert';

// import 'package:creadlymobile/Model/Core/Services/Helper/Configure/baseurl.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

import '../Configure/baseurl.dart';

class LoginApi {
  String endpoint = '${Baseurl().url}/api/v1/users/login';

  Future<Either<Exception, http.Response>> login(Map body) async {
    try {
      final response = await http.post(
          Uri.parse(
            endpoint,
          ),
          headers: {'Content-Type': 'application/json'},
          body: const JsonEncoder().convert(body));

      return Right(response);
    } on Exception catch (e) {
      return Left(e);
    }
  }
}
