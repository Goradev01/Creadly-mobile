import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../Configure/baseurl.dart';

class WishListApi {
  Future<Either<Exception, dynamic>> wishListApi() async {
    String url = "${Baseurl().url}/api/v1/users/wishlist";
    final SharedPreferences pref = await SharedPreferences.getInstance();
    String usertoken = pref.getString('AuthToken')!;
    try {
      final response = await http.get(
        Uri.parse(
          url,
        ),
        headers: {
          'Content-Type': 'application/json',
          "authorization": usertoken
        },
      );
      final data = jsonDecode(response.body);

      return Right([data][0]['wishlist']);
    } on Exception catch (e) {
      return Left(e);
    }
  }

  Future<Either<Exception, http.Response>> addWishListApi(
    Map body,
  ) async {
    String url = "${Baseurl().url}/api/v1/products/addToWishlist";
    final SharedPreferences pref = await SharedPreferences.getInstance();
    String usertoken = pref.getString('AuthToken')!;
    try {
      final response = await http.post(
          Uri.parse(
            url,
          ),
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

  Future<Either<Exception, dynamic>> removeWishList(String productId) async {
    String url = "${Baseurl().url}/api/v1/products/removeFromWishlist";
    Map body = {"productId": id};
    final SharedPreferences pref = await SharedPreferences.getInstance();
    String usertoken = pref.getString('AuthToken')!;
    try {
      final response = await http.post(Uri.parse(url),
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
