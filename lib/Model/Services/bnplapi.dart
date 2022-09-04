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
          "authorization":
              'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2MzBlN2VmOWQ4NTk1ZjgyNDE4NTljMDciLCJlbWFpbCI6Im1heW93YWlzYWFjb2xhZHVuam95ZUBnbWFpbC5jb20iLCJwaG9uZU51bWJlciI6IjA3MDM1ODA3MzUwIiwiY2FydCI6W10sIndpc2hsaXN0IjpbXSwiaWF0IjoxNjYxODk1OTQ0fQ.9Bw3fPpgWra-M9SDm7FRLvx8xjrOIZCu2tVrtovMPgA'
        },
      );
      final data = jsonDecode(response.body);
      print([data]);
      return Right([data]);
    } on Exception catch (e) {
      return Left(e);
    }
  }
}
