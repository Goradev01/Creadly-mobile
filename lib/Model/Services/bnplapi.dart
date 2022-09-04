import 'dart:convert';

import 'package:creadlymobile/Model/Configure/baseurl.dart';
import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class BnplApi {
  String endpoint =
      '${Baseurl().url}/api/v1/users/bnpl-salary-advance-and-pay-day-balance';

  Future<Either<Exception, dynamic>> bnplApi() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    String usertoken = pref.getString('AuthToken')!;
    try {
      final response = await http.get(
        Uri.parse(endpoint),
        headers: {
          'Content-Type': 'application/json',
          "authorization": usertoken
        },
      );
      final data = jsonDecode(response.body);

      return Right([data][0]['data']);
    } on Exception catch (e) {
      return Left(e);
    }
  }
}
