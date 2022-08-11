import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

import '../Configure/baseurl.dart';

class CategoryAPi {
  String endpoint = "${Baseurl().url}/api/v1/category";

  Future<Either<Exception, dynamic>> categoryapi() async {
    try {
      final response = await http.get(
        Uri.parse(
          endpoint,
        ),
        headers: {'Content-Type': 'application/json'},
      );
      final data = jsonDecode(response.body);

      return Right(data);
    } on Exception catch (e) {
      return Left(e);
    }
  }
}
