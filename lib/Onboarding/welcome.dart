import 'package:creadlymobile/Auth/login.dart';
import 'package:creadlymobile/Auth/signup.dart';
import 'package:creadlymobile/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    final design = Ui();

    final width = MediaQuery.of(context).size.width;
    return design.layout(Padding(
      padding: const EdgeInsets.fromLTRB(30, 50, 30, 10),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          design.lineartext('Welcome to ease'),
          design.hspacer(20),
          IconGradient(
            child: SvgPicture.asset('assets/welcome.svg',
                color: Colors.white, fit: BoxFit.fitHeight),
          ),
          design.hspacer(30),
          InkWell(
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (BuildContext context) {
                return const Signup();
              }));
            },
            child: design.longoutlineButton(width, 'Sign up'),
          ),
          design.hspacer(15),
          Builder(builder: (context) {
            return InkWell(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return const Login();
                }));
              },
              child: design.longButton(width, 'Sign in'),
            );
          }),
        ],
      ),
    ));
  }
}

class IconGradient extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const IconGradient({required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) => const LinearGradient(
        colors: <Color>[Color(0xffB5179E), Color(0xff3A0CA3)],
        tileMode: TileMode.mirror,
      ).createShader(bounds),
      child: child,
    );
  }
}
