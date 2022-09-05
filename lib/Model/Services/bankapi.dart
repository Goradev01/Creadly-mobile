import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../Configure/baseurl.dart';

class BankApi {
  String url = '${Baseurl().url}/api/v1/users/add-bank-account';

  Future<Either<Exception, http.Response>> addBankData(Map body) async {
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

  Future<Either<Exception, http.Response>> removeBank(String id) async {
    try {
      final response = await http.post(
        Uri.parse('${Baseurl().url}/api/v1/users/remove-bank-account/$id'),
        headers: {
          "Content-Type": "application/json",
        },
        // body: const JsonEncoder().convert(body)
      );
      return Right(response);
    } on Exception catch (e) {
      return Left(e);
    }
  }

  Future<Either<Exception, http.Response>> defaultBank(String id) async {
    try {
      final response = await http.post(
        Uri.parse('${Baseurl().url}/api/v1/users/make-account-default/$id'),
        headers: {
          "Content-Type": "application/json",
        },
        // body: const JsonEncoder().convert(body)
      );
      return Right(response);
    } on Exception catch (e) {
      return Left(e);
    }
  }
}
