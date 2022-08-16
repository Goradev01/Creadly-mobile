import 'dart:io';

import 'package:creadlymobile/Provider/verifyselfieprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../style.dart';
import 'facecompleted.dart';

class Submitface extends StatefulWidget {
  const Submitface({
    Key? key,
  }) : super(key: key);

  @override
  State<Submitface> createState() => _SubmitfaceState();
}

class _SubmitfaceState extends State<Submitface> {
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
              design.title('Face Scan'),
            ],
          ),
          Text(
            'Face Scan',
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
                child: Consumer<VerifySelfieProvider>(
                    builder: (context, data, child) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.file(
                      File(data.imageFile!.path),
                      width: width,
                      height: height / 1.7,
                      fit: BoxFit.fill,
                    ),
                  );
                })),
          ),
          Consumer<VerifySelfieProvider>(builder: (context, data, child) {
            return GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) => const Facecompleted()),
                  );
                  // Provider.of<VerifySelfieProvider>(context, listen: false)
                  //     .verifySelfie(data.imageFile!, context);
                },
                child: design.longButton(width, 'Submit'));
          })
        ],
      ),
    ));
  }
}
