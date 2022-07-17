import 'package:creadlymobile/style.dart';
import 'package:flutter/material.dart';

class Notificationpage extends StatefulWidget {
  const Notificationpage({Key? key}) : super(key: key);

  @override
  State<Notificationpage> createState() => _NotificationpageState();
}

class _NotificationpageState extends State<Notificationpage> {
  bool toggle = false;
  @override
  Widget build(BuildContext context) {
    final design = Ui();
    final width = MediaQuery.of(context).size.width;
    return design.layout(SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(25),
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
                design.title(' Notification'),
              ],
            ),
            design.hspacer(24),
            Container(
                height: 40,
                width: width,
                decoration: const BoxDecoration(color: Color(0xffF8F8FA)),
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Text(
                      'Push Notification',
                      style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.w500,
                          color: design.ash),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          toggle = !toggle;
                        });
                      },
                      child: Container(
                        height: 15,
                        width: 30,
                        alignment: toggle
                            ? Alignment.centerLeft
                            : Alignment.centerRight,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.white),
                        child: Container(
                          height: 15,
                          width: 15,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: toggle
                                  ? const Color(0xff00BA07)
                                  : const Color(0xffCE2E2E)),
                        ),
                      ),
                    )
                  ],
                )),
            design.hspacer(70),
            Column(
              children: List.generate(
                  4,
                  (index) => Container(
                      height: 57,
                      width: width,
                      decoration: const BoxDecoration(color: Color(0xffF8F8FA)),
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      margin: const EdgeInsets.symmetric(vertical: 5),
                      child: Row(
                        children: [
                          Container(
                            width: 30,
                            height: 30,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(
                                  width: 1,
                                  color: design.shadeP,
                                )),
                            child:
                                Icon(Icons.check, size: 10, color: design.blue),
                          ),
                          design.wspacer(20),
                          SizedBox(
                            width: 180,
                            child: Text(
                              'Your Salary advance of N1,000,000 had been approved',
                              style: TextStyle(
                                  fontSize: 10.0,
                                  fontWeight: FontWeight.w500,
                                  color: design.ash),
                            ),
                          ),
                          const Spacer(),
                          Text(
                            '12, Jun 2022',
                            style: TextStyle(
                                fontSize: 10.0,
                                fontWeight: FontWeight.w400,
                                color: design.blue),
                          ),
                        ],
                      ))),
            )
          ],
        ),
      ),
    ));
  }
}
