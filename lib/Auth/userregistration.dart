import 'package:camera/camera.dart';
import 'package:creadlymobile/Auth/facescan.dart';
import 'package:creadlymobile/style.dart';
import 'package:flutter/material.dart';

class Registration extends StatefulWidget {
  const Registration({Key? key}) : super(key: key);

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  String email = '';
  String phonenumber = '';
  String fullname = '';
  String companyinput = '';
  String bnv = '';
  String dateofbirth = '';
  String address = '';

  @override
  Widget build(BuildContext context) {
    final design = Ui();
    final width = MediaQuery.of(context).size.width;
    return design.layout(SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(25, 35, 35, 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                design.title('Info'),
              ],
            ),
            design.hspacer(20),
            Row(
              children: [
                Container(
                  width: 109,
                  height: 109,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(1),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(55),
                      gradient: const LinearGradient(
                          colors: [Color(0xffB5179E), Color(0xff3A0CA3)])),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(55),
                      child: Image.asset(
                        'assets/man.png',
                        fit: BoxFit.fill,
                        width: 109,
                        height: 109,
                      )),
                ),
                design.wspacer(10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hello Adekanye,',
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w700,
                          color: design.productblack),
                    ),
                    Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.symmetric(vertical: 5),
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3),
                          color: design.shadeP.withOpacity(0.2)),
                      child: Row(
                        children: [
                          Text(
                            'Upload Photo',
                            style: TextStyle(
                                fontSize: 10.0,
                                fontWeight: FontWeight.w500,
                                color: design.ash),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            design.hspacer(10),
            Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  design.smalltext('Email Address'),
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
                            email = input;
                          });
                        },
                        decoration: const InputDecoration(
                          // labelText: 'Email address',
                          border: InputBorder.none,
                          labelStyle: TextStyle(color: Colors.grey),
                          // errorText: validmail(email),
                        ),
                      )),
                  design.smalltext('Phone Number'),
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
                            phonenumber = input;
                          });
                        },
                        decoration: const InputDecoration(
                          // labelText: 'Email address',
                          border: InputBorder.none,
                          labelStyle: TextStyle(color: Colors.grey),
                          // errorText: validmail(email),
                        ),
                      )),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      design.smalltext('Full Name'),
                      design.wspacer(10),
                      Text(
                        'as seen on your ID*',
                        style: TextStyle(
                            color: design.pink,
                            fontSize: 7,
                            fontWeight: FontWeight.w400),
                      )
                    ],
                  ),
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
                            fullname = input;
                          });
                        },
                        decoration: const InputDecoration(
                          // labelText: 'Email address',
                          border: InputBorder.none,
                          labelStyle: TextStyle(color: Colors.grey),
                          // errorText: validmail(email),
                        ),
                      )),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      design.smalltext('Input company code'),
                      design.wspacer(10),
                      Text(
                        'optional',
                        style: TextStyle(
                            color: design.numb,
                            fontStyle: FontStyle.italic,
                            fontSize: 7,
                            fontWeight: FontWeight.w400),
                      )
                    ],
                  ),
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
                            companyinput = input;
                          });
                        },
                        decoration: const InputDecoration(
                          // labelText: 'Email address',
                          border: InputBorder.none,
                          labelStyle: TextStyle(color: Colors.grey),
                          // errorText: validmail(email),
                        ),
                      )),
                  design.smalltext('BNV'),
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
                            bnv = input;
                          });
                        },
                        decoration: const InputDecoration(
                          // labelText: 'Email address',
                          border: InputBorder.none,
                          labelStyle: TextStyle(color: Colors.grey),
                          // errorText: validmail(email),
                        ),
                      )),
                  design.smalltext('Date Of Birth'),
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
                            dateofbirth = input;
                          });
                        },
                        decoration: const InputDecoration(
                          // labelText: 'Email address',
                          border: InputBorder.none,
                          labelStyle: TextStyle(color: Colors.grey),
                          // errorText: validmail(email),
                        ),
                      )),
                  design.smalltext('Address'),
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
                            address = input;
                          });
                        },
                        decoration: const InputDecoration(
                          // labelText: 'Email address',
                          border: InputBorder.none,
                          labelStyle: TextStyle(color: Colors.grey),
                          // errorText: validmail(email),
                        ),
                      )),
                ],
              ),
            ),
            GestureDetector(
                onTap: () async {
                  final cameras = await availableCameras();
                  final firstCamera = cameras.first;
                  await Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => TakePictureScreen(
                        camera: firstCamera,
                        // Pass the automatically generated path to
                        // the DisplayPictureScreen widget.
                      ),
                    ),
                  );
                },
                child: design.longButton(width, 'Update'))
          ],
        ),
      ),
    ));
  }
}
