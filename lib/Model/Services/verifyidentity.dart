import 'package:camera/camera.dart';
import 'package:dartz/dartz.dart';

import '../Configure/baseurl.dart';
import 'package:http/http.dart' as http;

class VerifyIdentityApi {
  String endpoint = '${Baseurl().url}/api/v1/verify/identity';
  Future<Either<Exception, String>> verifyId(
      String type, String pin, String usertoken, XFile image) async {
    try {
      final res = http.MultipartRequest("POST", Uri.parse(endpoint));
      res.fields['idType'] = type;
      res.fields['idNumber'] = pin;

      Map<String, String> headers = {
        "Content-Type": "multipart/form-data",
        "authorization": usertoken
      };
      http.MultipartFile filepath =
          await http.MultipartFile.fromPath('idImage', image.path);
      res.files.add(filepath);
      res.headers.addAll(headers);
      final result = await res.send();

      return Right(result.statusCode.toString());
    } on Exception catch (e) {
      return Left(e);
    }
  }
}
