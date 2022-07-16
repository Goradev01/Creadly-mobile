import 'package:creadlymobile/style.dart';
import 'package:flutter/material.dart';

class Cardpage extends StatefulWidget {
  const Cardpage({Key? key}) : super(key: key);

  @override
  State<Cardpage> createState() => _CardpageState();
}

class Account {
  final String cardtype;
  final bool toggle;

  Account({
    required this.cardtype,
    required this.toggle,
  });
}

class _CardpageState extends State<Cardpage> {
  String amount = '';
  String cardNumber = '';
  String pin = '';
  String cv2 = '';
  String expiryDate = '';
  List<Account> accountinfo = [
    Account(cardtype: 'master', toggle: true),
    Account(cardtype: 'visa', toggle: true),
    Account(cardtype: 'master', toggle: false),
    Account(cardtype: 'visa', toggle: false),
  ];

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
            design.backnav(context, 'Cards and Accounts'),
            design.hspacer(20),
            GestureDetector(
              onTap: () {
                addaccountform(context, width, design);
              },
              child: Container(
                width: width,
                height: 50,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: design.shadeP,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: design.input(
                    design.blue, 12, 'Add New Bank Account', FontWeight.w500),
              ),
            ),
            design.hspacer(30),
            design.title('Bank Accounts'),
            design.hspacer(30),
            Column(
              children: List.generate(
                  accountinfo.length,
                  (index) => Container(
                      width: width,
                      margin: const EdgeInsets.symmetric(vertical: 5),
                      padding: const EdgeInsets.all(10),
                      height: 82,
                      decoration: BoxDecoration(
                          color: const Color(0xffF8F8FA),
                          borderRadius: BorderRadius.circular(5)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Image.asset('assets/access.png'),
                              const Spacer(),
                              GestureDetector(
                                onTap: () {},
                                child: Container(
                                  height: 10,
                                  width: 20,
                                  alignment: accountinfo[index].toggle
                                      ? Alignment.centerLeft
                                      : Alignment.centerRight,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: Colors.white),
                                  child: Container(
                                    height: 10,
                                    width: 10,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: accountinfo[index].toggle
                                            ? const Color(0xff00BA07)
                                            : const Color(0xffCE2E2E)),
                                  ),
                                ),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '1909 2890 XXXX XX83',
                                style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w500,
                                    color: design.ash),
                              ),
                              SizedBox(
                                  child: accountinfo[index].cardtype == 'master'
                                      ? Image.asset('assets/Mastercard.png')
                                      : Image.asset('assets/visa.png')),
                            ],
                          ),
                          RichText(
                            textAlign: TextAlign.center,
                            text: const TextSpan(
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 10,
                                  fontFamily: 'Moderat',
                                  fontWeight: FontWeight.w500),
                              children: <TextSpan>[
                                TextSpan(
                                  text: '00194958938  ',
                                ),
                                // design.naira(design.blue, 10.0),
                                TextSpan(
                                    text: 'Adekanye West Dotun',
                                    style: TextStyle(color: Color(0xff737373))),
                              ],
                            ),
                          ),
                        ],
                      ))),
            )
          ],
        ),
      ),
    ));
  }

  Future<dynamic> addaccountform(
      BuildContext context, double width, Ui design) {
    return showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30))),
        builder: (BuildContext context) {
          return SizedBox(
              width: width,
              height: 430,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(25, 30, 25, 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Add Card',
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w500,
                          color: design.blue),
                    ),
                    const Divider(),
                    Form(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          design.smalltext('Card Number'),
                          Container(
                              width: width,
                              alignment: Alignment.centerLeft,
                              margin:
                                  const EdgeInsets.only(top: 10, bottom: 10),
                              height: 40,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 30),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: const Color(0xffC0BACE),
                                      width: 1.5),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10))),
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                onFieldSubmitted: (input) {
                                  setState(() {
                                    cardNumber = input;
                                  });
                                },
                                decoration: const InputDecoration(
                                  // labelText: 'Email address',
                                  border: InputBorder.none,
                                  labelStyle: TextStyle(color: Colors.grey),
                                  // errorText: validmail(email),
                                ),
                              )),
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  design.smalltext('Expiry Date'),
                                  Container(
                                      width: (width / 2) - 70,
                                      alignment: Alignment.centerLeft,
                                      margin: const EdgeInsets.only(
                                          top: 10, bottom: 10),
                                      height: 40,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 30),
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: const Color(0xffC0BACE),
                                              width: 1.5),
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(10))),
                                      child: TextFormField(
                                        keyboardType: TextInputType.number,
                                        onFieldSubmitted: (input) {
                                          setState(() {
                                            expiryDate = input;
                                          });
                                        },
                                        decoration: const InputDecoration(
                                          // labelText: 'Email address',
                                          border: InputBorder.none,
                                          labelStyle:
                                              TextStyle(color: Colors.grey),
                                          // errorText: validmail(email),
                                        ),
                                      )),
                                ],
                              ),
                              const Spacer(),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  design.smalltext('CVV2'),
                                  Container(
                                      width: (width / 2) - 70,
                                      alignment: Alignment.centerLeft,
                                      margin: const EdgeInsets.only(
                                          top: 10, bottom: 10),
                                      height: 40,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 30),
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: const Color(0xffC0BACE),
                                              width: 1.5),
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(10))),
                                      child: TextFormField(
                                        keyboardType: TextInputType.number,
                                        onFieldSubmitted: (input) {
                                          setState(() {
                                            cv2 = input;
                                          });
                                        },
                                        decoration: const InputDecoration(
                                          // labelText: 'Email address',
                                          border: InputBorder.none,
                                          labelStyle:
                                              TextStyle(color: Colors.grey),
                                          // errorText: validmail(email),
                                        ),
                                      )),
                                ],
                              ),
                            ],
                          ),
                          design.smalltext('Pin'),
                          Container(
                              width: width,
                              alignment: Alignment.centerLeft,
                              margin:
                                  const EdgeInsets.only(top: 10, bottom: 10),
                              height: 40,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 30),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: const Color(0xffC0BACE),
                                      width: 1.5),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10))),
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                onFieldSubmitted: (input) {
                                  setState(() {
                                    pin = input;
                                  });
                                },
                                decoration: const InputDecoration(
                                  // labelText: 'Email address',
                                  border: InputBorder.none,
                                  labelStyle: TextStyle(color: Colors.grey),
                                  // errorText: validmail(email),
                                ),
                              )),
                        ],
                      ),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                        // setState(() {
                        //   added = true;
                        // });
                      },
                      child: design.longButton(width, 'Add'),
                    )
                  ],
                ),
              ));
        });
  }
}
