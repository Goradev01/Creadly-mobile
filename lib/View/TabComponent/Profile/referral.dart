import 'package:creadlymobile/View/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Referral extends StatefulWidget {
  const Referral({Key? key}) : super(key: key);

  @override
  State<Referral> createState() => _ReferralState();
}

class _ReferralState extends State<Referral> {
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
                design.title('Refferal'),
              ],
            ),
            design.hspacer(24),
            Container(
                width: width,
                height: 80,
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                    color: design.shadenew,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Credit Points',
                      style: TextStyle(
                          color: design.ash,
                          fontSize: 10,
                          fontWeight: FontWeight.w500),
                    ),
                    design.input(design.blue, 32, "200", FontWeight.w700)
                  ],
                )),
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
            design.hspacer(70),
            design.input(design.ash, 15, 'Referrals', FontWeight.w700),
            Column(
              children: List.generate(
                  5,
                  (index) => Container(
                      height: 50,
                      width: width,
                      decoration: const BoxDecoration(color: Color(0xffF8F8FA)),
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      margin: const EdgeInsets.symmetric(vertical: 5),
                      child: Row(
                        children: [
                          Image.asset('assets/user.png'),
                          design.wspacer(20),
                          Text(
                            'Adeyemi Quadri',
                            style: TextStyle(
                                fontSize: 10.0,
                                fontWeight: FontWeight.w500,
                                color: design.ash),
                          ),
                          const Spacer(),
                          Text(
                            '+ 10 points',
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
