// import 'package:camera/camera.dart';

import 'package:creadlymobile/View/TabComponent/Profile/resetpassword.dart';
import 'package:creadlymobile/View/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Userinfo extends StatefulWidget {
  const Userinfo({Key? key}) : super(key: key);

  @override
  State<Userinfo> createState() => _UserinfoState();
}

class _UserinfoState extends State<Userinfo> {
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
                design.wspacer(20),
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
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          var snackBar = SnackBar(
                            backgroundColor: Colors.white,
                            content: Text(
                              'Copied!',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w500,
                                  color: design.ash),
                            ),
                          );
                          Clipboard.setData(
                              const ClipboardData(text: "Credley/kanyetgev"));
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        },
                        child: Container(
                          width: 136,
                          height: 21,
                          alignment: Alignment.center,
                          margin: const EdgeInsets.symmetric(vertical: 5),
                          // padding: const EdgeInsets.fromLTRB(10, 5, 5, 5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(3),
                              color: design.shadeP.withOpacity(0.2)),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Credley/kanyetgev',
                                style: TextStyle(
                                    fontSize: 10.0,
                                    fontWeight: FontWeight.w500,
                                    color: design.ash),
                              ),
                              design.wspacer(5),
                              Icon(Icons.copy, color: design.blue, size: 9.17)
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            design.hspacer(30),
            design.title('User Info'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20, bottom: 5),
                      child: design.input(
                          design.numb, 10, 'Email Address', FontWeight.w500),
                    ),
                    design.input(design.ash, 10, 'Adekanyetegee@gmail.com',
                        FontWeight.w500),
                    Padding(
                      padding: const EdgeInsets.only(top: 20, bottom: 5),
                      child: design.input(
                          design.numb, 10, 'Phone Number', FontWeight.w500),
                    ),
                    design.input(
                        design.ash, 10, '09037849283', FontWeight.w500),
                    Padding(
                      padding: const EdgeInsets.only(top: 20, bottom: 5),
                      child: design.input(design.numb, 10,
                          'BVN (Bank Verification Number)', FontWeight.w500),
                    ),
                    design.input(
                        design.ash, 10, '30049302944', FontWeight.w500),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20, bottom: 5),
                      child: design.input(
                          design.numb, 10, 'Full Name', FontWeight.w500),
                    ),
                    design.input(
                        design.ash, 10, 'Adekanye Tega', FontWeight.w500),
                    Padding(
                      padding: const EdgeInsets.only(top: 20, bottom: 5),
                      child: design.input(
                          design.numb, 10, 'Company Code', FontWeight.w500),
                    ),
                    design.input(
                        design.ash, 10, 'GTCO (GT bank PLC)', FontWeight.w500),
                    Padding(
                      padding: const EdgeInsets.only(top: 20, bottom: 5),
                      child: design.input(
                          design.numb, 10, 'Date Of Birth', FontWeight.w500),
                    ),
                    design.input(
                        design.ash, 10, '21, June 1985', FontWeight.w500),
                  ],
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 5),
              child: design.input(design.numb, 10, 'Address', FontWeight.w500),
            ),
            design.input(
                design.ash,
                10,
                'This dummy text is suppose to include the address of the user and any other information that proves rthe address',
                FontWeight.w500),
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 5),
              child: design.input(design.numb, 10, 'Gender', FontWeight.w500),
            ),
            design.input(design.ash, 10, 'Male', FontWeight.w500),
            design.hspacer(40),
            Align(
                alignment: Alignment.centerRight,
                child: Container(
                  width: 169,
                  alignment: Alignment.center,
                  height: 50,
                  decoration: BoxDecoration(
                      color: design.shadeP,
                      borderRadius: BorderRadius.circular(10)),
                  child: Text("Edit",
                      style: TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.w500,
                          color: design.blue)),
                )),
            Padding(
              padding: const EdgeInsets.only(top: 30, bottom: 10),
              child: design.input(design.ash, 10, 'Password', FontWeight.w500),
            ),
            Container(
              width: width,
              alignment: Alignment.center,
              height: 40,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                  color: design.lightgrey,
                  borderRadius: BorderRadius.circular(5)),
              child: Row(
                children: [
                  design.input(design.ash, 10, '*********', FontWeight.w500),
                  const Spacer(),
                  GestureDetector(
                    onTap: () async {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const Resetpassword(),
                        ),
                      );
                    },
                    child: Text("Reset Password",
                        style: TextStyle(
                            fontSize: 12.0,
                            fontWeight: FontWeight.w500,
                            color: design.blue)),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}
