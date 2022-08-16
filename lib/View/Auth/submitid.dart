import 'dart:io';

import 'package:camera/camera.dart';
import 'package:creadlymobile/Provider/verifyidprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Provider/verifyselfieprovider.dart';
import '../style.dart';

class Submitid extends StatefulWidget {
  final XFile image;

  const Submitid({Key? key, required this.image}) : super(key: key);

  @override
  State<Submitid> createState() => _SubmitidState();
}

class _SubmitidState extends State<Submitid> {
  @override
  Widget build(BuildContext context) {
    final design = Ui();
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return design.layout(Padding(
      padding: const EdgeInsets.fromLTRB(25, 35, 25, 10),
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
              design.title('Id Card Scan'),
            ],
          ),
          Text(
            'Id Card Scan',
            style: TextStyle(
                fontSize: 20.0, fontWeight: FontWeight.w700, color: design.ash),
          ),
          Container(
            width: width,
            alignment: Alignment.center,
            height: height / 1.7,
            decoration: BoxDecoration(
                border: Border.all(
              color: design.numb,
              width: 1,
            )),
            child: Container(
                width: width,
                alignment: Alignment.center,
                height: height / 1.7,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: const LinearGradient(
                      colors: [
                        Color(0xffE1E1EC),
                        Color(0xffFFFFFF),
                        Color(0xffE1E1EC),
                      ],
                    )),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.file(
                    File(widget.image.path),
                    width: width,
                    height: height / 1.7,
                    fit: BoxFit.fill,
                  ),
                )),
          ),
          GestureDetector(
              onTap: () async {
                final idNumber =
                    Provider.of<VerifySelfieProvider>(context, listen: false)
                        .idNumber;
                final idType =
                    Provider.of<VerifySelfieProvider>(context, listen: false)
                        .idType;
                final selfie =
                    Provider.of<VerifySelfieProvider>(context, listen: false)
                        .imageFile;
                await Provider.of<VerifySelfieProvider>(context, listen: false)
                    .verifySelfie(selfie!);
                Provider.of<VerifyIdProvider>(context, listen: false)
                    .verifyId(idType, idNumber, widget.image, context);
              },
              child: design.longButton(width, 'Submit'))
        ],
      ),
    ));
  }
}
