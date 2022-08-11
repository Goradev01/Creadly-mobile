import 'package:creadlymobile/View/TabComponent/bottomnav.dart';
import 'package:creadlymobile/View/style.dart';
import 'package:flutter/material.dart';

class WelcomeAuth extends StatefulWidget {
  const WelcomeAuth({Key? key}) : super(key: key);

  @override
  State<WelcomeAuth> createState() => _WelcomeAuthState();
}

class _WelcomeAuthState extends State<WelcomeAuth> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final design = Ui();
    return design.layout(Padding(
      padding: const EdgeInsets.fromLTRB(30, 50, 30, 50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/Star 14.png'),
          design.hspacer(50),
          design.lineartext('Welcome'),
          design.hspacer(30),
          SizedBox(
            width: width - 80,
            child: const Text(
              'Congratulation on your account with Credley. You can go ahead and start shopping without limit',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w700,
                  color: Color(0xff2E2E2E)),
            ),
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return const BottomNav();
              }));
            },
            child: design.linearGButton(width, 'Start Shopping'),
          )
        ],
      ),
    ));
  }
}
