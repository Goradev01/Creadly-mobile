import 'dart:convert';

import 'package:dartz/dartz.dart';

import '../Configure/baseurl.dart';
import 'package:http/http.dart' as http;

class AddCartApi {
  String endpoint = "${Baseurl().url}/api/v1/products/addToCart";

  Future<Either<Exception, dynamic>> addCartApi(
      Map body, String usertoken) async {
    try {
      final response = await http.post(
          Uri.parse(
            endpoint,
          ),
          headers: {
            "Content-Type": "application/json",
            "authorization": usertoken
          },
          body: const JsonEncoder().convert(body));
      return Right(response.statusCode);
    } on Exception catch (e) {
      return Left(e);
    }
  }
}
