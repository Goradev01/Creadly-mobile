// ignore_for_file: use_build_context_synchronously

import 'package:camera/camera.dart';
import 'package:creadlymobile/Auth/scanid.dart';
import 'package:creadlymobile/style.dart';
import 'package:flutter/material.dart';

class Idform extends StatefulWidget {
  const Idform({Key? key}) : super(key: key);

  @override
  State<Idform> createState() => _IdformState();
}

class _IdformState extends State<Idform> {
  String idnumber = '';
  @override
  Widget build(BuildContext context) {
    final design = Ui();
    final width = MediaQuery.of(context).size.width;
    return design.layout(Padding(
      padding: const EdgeInsets.fromLTRB(25, 35, 25, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
              design.title('Upload Id'),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              design.smalltext('Input ID Number'),
              Container(
                  width: width,
                  alignment: Alignment.centerLeft,
                  margin: const EdgeInsets.only(top: 10, bottom: 20),
                  height: 51,
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: const Color(0xffC0BACE), width: 1.5),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10))),
                  child: TextFormField(
                    initialValue: '',
                    onFieldSubmitted: (input) {
                      setState(() {
                        idnumber = input;
                      });
                    },
                    decoration: const InputDecoration(
                      // labelText: 'Email address',
                      border: InputBorder.none,
                      labelStyle: TextStyle(color: Colors.grey),
                      // errorText: validmail(email),
                    ),
                  )),
              design.hspacer(20),
              GestureDetector(
                onTap: () async {
                  final cameras = await availableCameras();
                  final firstCamera = cameras.first;
                  await Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => Scanid(
                        camera: firstCamera,
                        // Pass the automatically generated path to
                        // the DisplayPictureScreen widget.
                      ),
                    ),
                  );
                },
                child: Container(
                  width: width,
                  alignment: Alignment.center,
                  height: 50,
                  decoration: BoxDecoration(
                      color: design.shadeP,
                      borderRadius: BorderRadius.circular(10)),
                  child: Text('Go ahead to scan',
                      style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500,
                          color: design.blue)),
                ),
              ),
            ],
          ),
          const SizedBox()
        ],
      ),
    ));
  }
}
