// ignore_for_file: use_build_context_synchronously

import 'package:camera/camera.dart';
import 'package:creadlymobile/View/Auth/scanface.dart';
import 'package:creadlymobile/View/style.dart';
import 'package:flutter/material.dart';

class Verificationpage extends StatefulWidget {
  const Verificationpage({Key? key}) : super(key: key);

  @override
  State<Verificationpage> createState() => _VerificationpageState();
}

class _VerificationpageState extends State<Verificationpage> {
  @override
  Widget build(BuildContext context) {
    final design = Ui();
    final width = MediaQuery.of(context).size.width;
    return design.layout(Padding(
      padding: const EdgeInsets.fromLTRB(25, 35, 25, 25),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Container(
                    alignment: Alignment.center,
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color(0xffF8F8FA)),
                    child: Icon(
                      Icons.arrow_back_ios,
                      size: 10,
                      color: design.blue,
                    )),
              ),
              design.wspacer(19),
              design.title('Verification'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.all(3),
                    height: 22,
                    width: 22,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(11),
                        color: design.blue),
                    child: const Text(
                      '1',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  Text(
                    'Face scan',
                    style: TextStyle(
                        color: design.blue,
                        fontSize: 10,
                        fontWeight: FontWeight.w700),
                  )
                ],
              ),
              Container(
                alignment: Alignment.center,
                height: 5,
                margin: const EdgeInsets.all(3),
                width: 86,
                decoration: BoxDecoration(
                    // borderRadius: BorderRadius.circular(11),
                    color: design.shadeP),
              ),
              Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.all(3),
                    height: 22,
                    width: 22,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(11),
                        color: design.shadeP),
                    child: const Text(
                      '2',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 10,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  Text(
                    'Upload id',
                    style: TextStyle(
                        color: design.shadeP,
                        fontSize: 10,
                        fontWeight: FontWeight.w700),
                  )
                ],
              )
            ],
          ),
          design.title('Face Scan'),
          Container(
            alignment: Alignment.center,
            height: 141,
            width: 141,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color(0xfffafafa)),
          ),
          SizedBox(
            width: width / 2,
            child: const Text(
              'How would you prefer to upload this document',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color(0xff4d4d4d),
                  fontSize: 14,
                  fontWeight: FontWeight.w700),
            ),
          ),
          GestureDetector(
              onTap: () async {
                final cameras = await availableCameras();
                final firstCamera = cameras.firstWhere((camera) =>
                    camera.lensDirection == CameraLensDirection.front);
                await Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => Scanface(
                      camera: firstCamera,
                      // Pass the automatically generated path to
                      // the DisplayPictureScreen widget.
                    ),
                  ),
                );
              },
              child: design.longButton(width, 'Scan'))
        ],
      ),
    ));
  }
}
