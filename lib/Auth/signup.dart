import 'package:creadlymobile/Auth/login.dart';
import 'package:creadlymobile/style.dart';
import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  String email = '';
  String password = '';
  String phoneNumber = '';
  final formkey = GlobalKey<FormState>();
  bool showPassword = false;
  @override
  Widget build(BuildContext context) {
    final design = Ui();
    final width = MediaQuery.of(context).size.width;
    return design.layout(Padding(
      padding: const EdgeInsets.all(30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(Icons.arrow_back_ios, size: 20, color: design.blue)),
          design.hspacer(30),
          Center(
            child: design.lineartext('Create an account'),
          ),
          design.hspacer(50),
          Form(
              key: formkey,
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
                        keyboardType: TextInputType.phone,
                        onFieldSubmitted: (input) {
                          setState(() {
                            phoneNumber = input;
                          });
                        },
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          labelStyle: TextStyle(color: Colors.grey),
                        ),
                      )),
                  design.smalltext('Password'),
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
                              onFieldSubmitted: (passwordinput) {
                                setState(() {
                                  password = passwordinput;
                                });
                              },
                              decoration: const InputDecoration(
                                // labelText: 'Email address',
                                border: InputBorder.none,
                                labelStyle: TextStyle(color: Colors.grey),
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
                  design.hspacer(50),
                  design.longButton(width, 'Sign up'),
                  Center(
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return const Login();
                        }));
                      },
                      child: RichText(
                        text: TextSpan(
                          style: TextStyle(
                              color: design.ash,
                              fontSize: 12,
                              fontFamily: 'Moderat',
                              fontWeight: FontWeight.w500),
                          children: <TextSpan>[
                            const TextSpan(
                              text: 'Already have an account? ',
                            ),
                            TextSpan(
                                text: 'Log In',
                                style: TextStyle(color: design.blue)),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              )),
        ],
      ),
    ));
  }
}
