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
            "authorization":
                'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2MmE3NGJjZDIxNWIyODllNWRlZThiYTMiLCJlbWFpbCI6Im1heW93YW9sYWR1bmpveWVAZ21haWwuY29tIiwicGhvbmVOdW1iZXIiOiIwNzAzNTgwNzM1MCIsImNhcnQiOlsiNjJlZThhZGVkYmIzYjA5YjJlZjNjMWIyIiwiNjJlZThhZGVkYmIzYjA5YjJlZjNjMWIyIiwiNjJlZThhZGVkYmIzYjA5YjJlZjNjMWIyIiwiNjJlZThhZGVkYmIzYjA5YjJlZjNjMWIyIiwiNjJlZThhZGVkYmIzYjA5YjJlZjNjMWIyIiwiNjJlZThhZGVkYmIzYjA5YjJlZjNjMWIyIiwiNjJmNTVmZTZjYTcwMGQ2ZDc0ZmZmODM1IiwiNjJmNTVmZTZjYTcwMGQ2ZDc0ZmZmODM1IiwiNjJlZThhZGVkYmIzYjA5YjJlZjNjMWIyIl0sIndpc2hsaXN0IjpbXSwiaWF0IjoxNjYwOTA2NDAxfQ.GHqWhKif4_NGCyUiQavf3lTXQt-bFYDz8Dcrphv4khs',
          });
      final data = jsonDecode(response.body);
      return Right(data);
    } on Exception catch (e) {
      return Left(e);
    }
  }
}
