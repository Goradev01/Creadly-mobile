import 'package:camera/camera.dart';
import 'package:dartz/dartz.dart';

import '../Configure/baseurl.dart';
import 'package:http/http.dart' as http;

class VerifySelfieApi {
  String endpoint = '${Baseurl().url}/api/v1/verify/selfie';
  Future<Either<Exception, String>> verifySelfie(
      String type, String pin, String usertoken, XFile image) async {
    try {
      final res = http.MultipartRequest("POST", Uri.parse(endpoint));
      res.fields['idType'] = type;
      res.fields['idNumber'] = pin;

      Map<String, String> headers = {
        "Content-Type": "multipart/form-data",
        // ignore: unnecessary_string_interpolations
        "authorization": usertoken
      };
      http.MultipartFile filepath =
          await http.MultipartFile.fromPath('selfieImage', image.path);
      res.files.add(filepath);
      res.headers.addAll(headers);
      final result = await res.send();
      // final response = await http.post(Uri.parse(endpoint),
      //     headers: {
      //       'authorization': usertoken,
      //       'Content-Type': 'multipart/form-data'
      //     },
      //     body: body);
      return Right(result.statusCode.toString());
    } on Exception catch (e) {
      return Left(e);
    }
  }
}
