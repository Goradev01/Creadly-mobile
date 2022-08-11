// ignore_for_file: use_build_context_synchronously

import 'package:creadlymobile/View/Auth/login.dart';
import 'package:creadlymobile/Provider/signup.dart';
import 'package:creadlymobile/View/style.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
                        onChanged: (input) {
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
                        onChanged: (input) {
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
                              onChanged: (passwordinput) {
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
                  GestureDetector(
                    onTap: () {
                      Provider.of<SignupProvider>(context, listen: false)
                          .updateloadsignup(true);
                      Provider.of<SignupProvider>(context, listen: false)
                          .authSignUp(email, phoneNumber, password, context);
                    },
                    child: Container(
                      width: width,
                      height: 50,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          color: design.blue,
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Expanded(child: SizedBox()),
                            const Expanded(
                                child: Text("Sign up",
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white))),
                            const Spacer(),
                            Consumer<SignupProvider>(
                                builder: (context, data, child) {
                              return Visibility(
                                visible: data.loadsignup,
                                child: const SizedBox(
                                  height: 20,
                                  width: 20,
                                  child: CircularProgressIndicator(
                                      strokeWidth: 3,
                                      // value: 0.5,
                                      color: Color(0xff71BBE0),
                                      backgroundColor: Colors.white),
                                ),
                              );
                            })
                          ]),
                    ),
                  ),
                  // design.longButton(width, 'Sign up'),
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
