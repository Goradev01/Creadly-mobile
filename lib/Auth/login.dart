import 'package:creadlymobile/Auth/otp.dart';
import 'package:creadlymobile/Auth/signup.dart';
import 'package:creadlymobile/style.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String email = '';
  String password = '';

  final formkey = GlobalKey<FormState>();
  bool showPassword = false;
  Future<void> setData(token) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('AuthToken', token).whenComplete(() => Navigator.of(context)
            .pushReplacement(MaterialPageRoute(builder: (context) {
          return const Otp();
        })));
  }

  Future authlogin(String email, String password) async {
    Map body = {
      "email": email,
      "password": password,
    };
    try {
      final response = await http.post(
          Uri.parse(
            "http://simptomini-backend.herokuapp.com/api/v1/users/login",
          ),
          headers: {'Content-Type': 'application/json'},
          body: const JsonEncoder().convert(body));
      // print(response.body);
      if (response.body == 'Unauthorized') {
        errorAlert(response.body);
      } else if (response.body == 'Bad Request') {
        errorAlert('Error');
      } else {
        setData(response.body);
        // errorAlert('on data');
      }
    } on Exception {
      errorAlert('error');
    }
  }

  void errorAlert(response) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Text(response),
            actions: [
              TextButton(
                  onPressed: () {
                    //DeleteProduct(Image, Category, Id)

                    Navigator.pop(context);
                  },
                  child: const Text('back')),
            ],
          );
        });
  }

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
          design.lineartext('Log in'),
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
                            email = input.trim();
                          });
                        },
                        decoration: const InputDecoration(
                          // labelText: 'Email address',
                          border: InputBorder.none,
                          labelStyle: TextStyle(color: Colors.grey),
                          // errorText: validmail(email),
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
                  design.hspacer(50),
                  InkWell(
                      onTap: () {
                        authlogin(email, password);
                      },
                      child: design.longButton(width, 'Log in')),
                  Center(
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return const Signup();
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
                              text: 'Don’t have an account? ',
                            ),
                            TextSpan(
                                text: 'Sign Up',
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
