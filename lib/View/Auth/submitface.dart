import 'dart:io';

import 'package:creadlymobile/View/Auth/facecompleted.dart';
import 'package:flutter/material.dart';

import '../style.dart';

class Submitface extends StatefulWidget {
  final String imagepath;

  const Submitface({Key? key, required this.imagepath}) : super(key: key);

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
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.file(
                    File(widget.imagepath),
                    width: width,
                    height: height / 1.7,
                    fit: BoxFit.fill,
                  ),
                )),
          ),
          GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context) => const Facecompleted()),
                );
              },
              child: design.longButton(width, 'Submit'))
        ],
      ),
    ));
  }
}
