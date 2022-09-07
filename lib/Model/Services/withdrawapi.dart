import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../Configure/baseurl.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

class WithdrawApi {
  String endpoint = "${Baseurl().url}/api/v1/users/withdrawal";

  Future<Either<Exception, dynamic>> withdrawPerApi(String id) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    String usertoken = pref.getString('AuthToken')!;
    try {
      final response = await http.get(Uri.parse('$endpoint/$id'), headers: {
        "Content-Type": "application/json",
        "authorization": usertoken,
      });
      final data = jsonDecode(response.body);

      return Right([data][0]);
    } on Exception catch (e) {
      return Left(e);
    }
  }

  Future<Either<Exception, dynamic>> withdrawApi() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    String usertoken = pref.getString('AuthToken')!;
    try {
      final response = await http.get(Uri.parse(endpoint), headers: {
        "authorization": usertoken,
      });
      final data = jsonDecode(response.body);

      return Right(data);
    } on Exception catch (e) {
      return Left(e);
    }
  }

  Future<Either<Exception, http.Response>> postWithdraw(
    Map body,
  ) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    String usertoken = pref.getString('AuthToken')!;
    try {
      final response = await http.patch(
          Uri.parse(
            endpoint,
          ),
          headers: {
            'Content-Type': 'application/json',
            "authorization": usertoken
          },
          body: const JsonEncoder().convert(body));

      return Right(response);
    } on Exception catch (e) {
      return Left(e);
    }
  }
}
