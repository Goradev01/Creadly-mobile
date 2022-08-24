import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

import '../Configure/baseurl.dart';

class UserDataApi {
  String endpoint = "${Baseurl().url}/api/v1/users";

  Future<Either<Exception, dynamic>> userDataApi(String usertoken) async {
    try {
      final response = await http.get(Uri.parse(endpoint), headers: {
        "Content-Type": "application/json",
        "authorization": usertoken,
      });
      final data = jsonDecode(response.body);

      return Right([data]);
    } on Exception catch (e) {
      return Left(e);
    }
  }
}
