import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  Future<Either<Exception, http.Response>> removeCartApi(
      String productId) async {
    String url = "${Baseurl().url}/api/v1/products/removeFromCart";
    Map body = {"productId": productId};
    final SharedPreferences pref = await SharedPreferences.getInstance();
    String usertoken = pref.getString('AuthToken')!;
    try {
      final response = await http.post(Uri.parse(url),
          headers: {
            "Content-Type": "application/json",
            "authorization": usertoken
          },
          body: const JsonEncoder().convert(body));
      return Right(response);
    } on Exception catch (e) {
      return Left(e);
    }
  }
}
