import 'dart:convert';

import 'package:creadlymobile/Model/Configure/baseurl.dart';
import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class VerificationApi {
  String endpoint = '${Baseurl().url}/api/v1/users/verify';

  Future<Either<Exception, http.Response>> verifyOtp(String otp) async {
    Map body = {"token": otp};
    final SharedPreferences pref = await SharedPreferences.getInstance();
    String usertoken = pref.getString('AuthToken')!;
    try {
      final response = await http.post(Uri.parse(endpoint),
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
