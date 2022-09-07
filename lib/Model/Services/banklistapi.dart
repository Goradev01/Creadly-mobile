import 'dart:convert';

import 'package:creadlymobile/Model/Configure/baseurl.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class BankListApi {
  String endpoint = '${Baseurl().url}/api/v1/transfers/bank';
  Future<Either<Exception, dynamic>> getBankList() async {
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
      final result = jsonDecode(response.body);

      return Right([result][0]['data']['data']);
    } on Exception catch (e) {
      return Left(e);
    }
  }
}
