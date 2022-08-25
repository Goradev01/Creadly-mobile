import 'package:creadlymobile/Model/Configure/baseurl.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class OrderApi {
  String endpoint = '${Baseurl().url}/api/v1/orders/user';
  Future<Either<Exception, dynamic>> orderApi(String usertoken) async {
    try {
      final response = await http.get(
          Uri.parse(
            endpoint,
          ),
          headers: {
            "Content-Type": "application/json",
            "authorization": usertoken,
          });
      final data = jsonDecode(response.body);
      return Right(data);
    } on Exception catch (e) {
      return Left(e);
    }
  }
}
