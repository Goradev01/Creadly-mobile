import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

import '../Configure/baseurl.dart';

class SignUpAPi {
  String endpoint = '${Baseurl().url}/api/v1/users';

  Future<Either<Exception, String>> signup(Map body) async {
    try {
      final response = await http.post(
          Uri.parse(
            endpoint,
          ),
          headers: {'Content-Type': 'application/json'},
          body: const JsonEncoder().convert(body));

      return Right(response.body);
    } on Exception catch (e) {
      return Left(e);
    }
  }
}
