import 'dart:convert';

import 'package:dartz/dartz.dart';

import '../Configure/baseurl.dart';
import 'package:http/http.dart' as http;

class MerchantApi {
  String endpoint = "${Baseurl().url}/api/v1/merchant/";

  Future<Either<Exception, dynamic>> merchantapi() async {
    try {
      final response = await http.get(Uri.parse(endpoint),
          headers: {'Context-Type': 'application/json'});
      final data = jsonDecode(response.body);
      return Right(data);
    } on Exception catch (e) {
      return Left(e);
    }
  }
}
