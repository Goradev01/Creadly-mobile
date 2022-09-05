import 'package:creadlymobile/View/style.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Provider/verificationprovider.dart';

class Otp extends StatefulWidget {
  const Otp({Key? key}) : super(key: key);

  @override
  State<Otp> createState() => _OtpState();
}

class _OtpState extends State<Otp> {
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
          design.lineartext('Kindly Verify OTP'),
          design.hspacer(50),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  style: TextStyle(
                      color: design.ash,
                      fontSize: 12,
                      fontFamily: 'Moderat',
                      fontWeight: FontWeight.w500),
                  children: <TextSpan>[
                    const TextSpan(
                      text: 'Kindly check your ',
                    ),
                    TextSpan(
                        text: 'Mail ', style: TextStyle(color: design.pink)),
                    const TextSpan(
                      text: 'and ',
                    ),
                    TextSpan(
                        text: 'SMS ', style: TextStyle(color: design.pink)),
                    const TextSpan(
                      text: 'for the OTP that has been Sent',
                    ),
                  ],
                ),
              ),
              design.hspacer(10),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                      4,
                      (index) => Container(
                          width: 67,
                          height: 81,
                          padding: const EdgeInsets.all(2.5),
                          margin: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: const Color(0xfff4f4f4),
                            border: Border.all(
                                width: 1, color: const Color(0xffC0BACE)),
                            borderRadius: BorderRadius.circular(5),
                          )))),
              design.hspacer(10),
              Center(child: design.ptext('OTP Expires in 60secs')),
              design.hspacer(80),
              GestureDetector(
                onTap: () {
                  Provider.of<VerificationProvider>(context, listen: false)
                      .verify('token', context);
                },
                child: design.longButton(width, 'Submit'),
              ),
            ],
          ),
        ],
      ),
    ));
  }
}
