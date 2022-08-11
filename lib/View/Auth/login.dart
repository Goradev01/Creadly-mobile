import 'package:creadlymobile/Provider/login.dart';
import 'package:creadlymobile/View/Auth/signup.dart';
import 'package:creadlymobile/View/style.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
                        onChanged: (input) {
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
                  design.hspacer(50),
                  InkWell(
                      onTap: () {
                        Provider.of<LoginProvider>(context, listen: false)
                            .updateloadlogin(true);
                        Provider.of<LoginProvider>(context, listen: false)
                            .authLogin(
                              email,
                              password,
                              context,
                            )
                            .then((value) => Navigator.of(context).pop());
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
                                child: Center(
                                  child: Text("Log in",
                                      style: TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white)),
                                ),
                              ),
                              const Spacer(),
                              Consumer<LoginProvider>(
                                  builder: (context, data, child) {
                                return Visibility(
                                  visible: data.loadlogin,
                                  child: SizedBox(
                                    height: 20,
                                    width: 20,
                                    child: CircularProgressIndicator(
                                        strokeWidth: 3,
                                        // value: 0.5,
                                        color: design.blue,
                                        backgroundColor: Colors.white),
                                  ),
                                );
                              })
                            ]),
                      )),
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
