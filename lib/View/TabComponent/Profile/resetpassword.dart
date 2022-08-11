// import 'package:camera/camera.dart';

import 'package:creadlymobile/View/style.dart';
import 'package:flutter/material.dart';

class Resetpassword extends StatefulWidget {
  const Resetpassword({Key? key}) : super(key: key);

  @override
  State<Resetpassword> createState() => _ResetpasswordState();
}

class _ResetpasswordState extends State<Resetpassword> {
  String password = '';
  bool showPassword = false;

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
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 20),
              child: design.input(
                  design.ash, 15, 'Password Reset', FontWeight.w700),
            ),
            Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  design.smalltext('New Password'),
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
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: width * 0.5,
                            child: TextFormField(
                              initialValue: '',
                              obscureText: !showPassword,
                              onChanged: (passwordinput) {
                                setState(() {
                                  password = passwordinput.trim();
                                });
                              },
                              decoration: const InputDecoration(
                                // labelText: 'Email address',
                                border: InputBorder.none,
                                labelStyle: TextStyle(color: Colors.grey),
                                // errorText: validmail(email),
                                // hintText: 'Password',
                              ),
                            ),
                          ),
                          IconButton(
                              icon: Icon(
                                Icons.remove_red_eye,
                                color: showPassword ? Colors.blue : Colors.grey,
                              ),
                              onPressed: () {
                                setState(() => {
                                      showPassword = !showPassword,
                                    });
                              })
                        ],
                      )),
                  design.smalltext('Retype New Password'),
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
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: width * 0.5,
                            child: TextFormField(
                              initialValue: '',
                              obscureText: !showPassword,
                              onChanged: (passwordinput) {
                                setState(() {
                                  password = passwordinput.trim();
                                });
                              },
                              decoration: const InputDecoration(
                                // labelText: 'Email address',
                                border: InputBorder.none,
                                labelStyle: TextStyle(color: Colors.grey),
                                // errorText: validmail(email),
                                // hintText: 'Password',
                              ),
                            ),
                          ),
                          IconButton(
                              icon: Icon(
                                Icons.remove_red_eye,
                                color: showPassword ? Colors.blue : Colors.grey,
                              ),
                              onPressed: () {
                                setState(() => {
                                      showPassword = !showPassword,
                                    });
                              })
                        ],
                      )),
                ],
              ),
            ),
            GestureDetector(
                onTap: () async {
                  // Navigator.of(context).push(
                  //   MaterialPageRoute(
                  //     builder: (context) => const Verificationpage(),
                  //   ),
                  // );
                },
                child: design.longButton(width, 'Update'))
          ],
        ),
      ),
    ));
  }
}
