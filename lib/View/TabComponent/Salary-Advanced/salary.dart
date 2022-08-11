import 'package:creadlymobile/View/TabComponent/Salary-Advanced/withdrawalhistory.dart';
import 'package:creadlymobile/View/style.dart';
import 'package:flutter/material.dart';

class SalaryAdvanced extends StatefulWidget {
  const SalaryAdvanced({Key? key}) : super(key: key);

  @override
  State<SalaryAdvanced> createState() => _SalaryAdvancedState();
}

class Withdraw {
  String amount;
  String date;
  String mode;
  Withdraw({required this.amount, required this.date, required this.mode});
}

class _SalaryAdvancedState extends State<SalaryAdvanced> {
  String amount = '';
  String cardNumber = '';
  String pin = '';
  String cv2 = '';
  bool added = false;
  String expiryDate = '';
  List<Withdraw> withdrawinfo = [
    Withdraw(amount: '200,000', date: '22, May 2022', mode: 'Pending'),
    Withdraw(amount: '200,000', date: '22, May 2022', mode: 'Successful'),
    Withdraw(amount: '200,000', date: '22, May 2022', mode: 'UnSuccessful'),
  ];
  @override
  Widget build(BuildContext context) {
    final design = Ui();
    final width = MediaQuery.of(context).size.width;
    return design.layout(SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 25),
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(25, 10, 25, 10),
            child: Row(
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
                design.title('Salary Advance'),
              ],
            ),
          ),
          Container(
              width: width - 50,
              padding: const EdgeInsets.symmetric(vertical: 11.5),
              height: 100,
              decoration: BoxDecoration(
                color: design.shadePi,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                        height: 12,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Expanded(child: SizedBox()),
                            Expanded(
                                child: Center(
                                    child:
                                        design.smalltext('Amount Loanable'))),
                            Expanded(
                                child: Align(
                                    alignment: Alignment.topCenter,
                                    child:
                                        Image.asset('assets/yellowerror.png'))),
                          ],
                        )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('N',
                            style: TextStyle(
                                fontSize: 33,
                                color: design.blue,
                                decorationStyle: TextDecorationStyle.double,
                                decorationColor: design.blue,
                                decoration: TextDecoration.lineThrough)),
                        Text('300,000',
                            style: TextStyle(
                              fontSize: 32,
                              color: design.blue,
                              fontWeight: FontWeight.w700,
                              decorationColor: design.blue,
                            ))
                      ],
                    ),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 5,
                            width: width * 0.6,
                            margin: const EdgeInsets.only(right: 5),
                            alignment: Alignment.topLeft,
                            decoration: BoxDecoration(
                                color: const Color(0xffffffff),
                                borderRadius: BorderRadius.circular(2.5)),
                            child: Container(
                                height: 5,
                                width: (width * 0.6) * 0.9,
                                decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.horizontal(
                                        left: Radius.circular(2.5)),
                                    gradient: LinearGradient(
                                      colors: <Color>[
                                        Color(0xffB5179E),
                                        Color(0xff3A0CA3)
                                      ],
                                    ))),
                          ),
                          const Text('90')
                        ],
                      ),
                    )
                  ])),
          Padding(
            padding: const EdgeInsets.fromLTRB(25, 10, 25, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                  text: TextSpan(
                    style: TextStyle(
                        color: design.numb,
                        fontSize: 10,
                        fontFamily: 'Moderat',
                        fontWeight: FontWeight.w500),
                    children: <TextSpan>[
                      const TextSpan(
                        text: 'Current Debt: ',
                      ),
                      // design.naira(design.blue, 10.0),
                      TextSpan(
                          text: '70,000', style: TextStyle(color: design.blue)),
                    ],
                  ),
                ),
                RichText(
                  text: TextSpan(
                    style: TextStyle(
                        color: design.numb,
                        fontSize: 10,
                        fontFamily: 'Moderat',
                        fontWeight: FontWeight.w500),
                    children: <TextSpan>[
                      const TextSpan(
                        text: 'Total Loanable Amount:',
                      ),
                      // design.naira(design.blue, 10.0),
                      TextSpan(
                          text: '370,000',
                          style: TextStyle(color: design.blue)),
                    ],
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(25, 50, 25, 10),
            child: Visibility(
                visible: !added,
                child: Column(
                  children: [
                    const Text(
                      'No Bank Account Added yet',
                      style: TextStyle(
                          color: Color(0xff737373),
                          fontSize: 10,
                          fontWeight: FontWeight.w400),
                    ),
                    design.hspacer(20),
                    GestureDetector(
                      onTap: () {
                        addaccountform(context, width, design);
                      },
                      child: design.longoutlineButton(
                          width, 'Add New Bank Account'),
                    )
                  ],
                )),
          ),
          Visibility(
            visible: added,
            child: Column(
              children: [
                Form(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(25, 10, 25, 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        design.smalltext('Amount'),
                        Container(
                            width: width,
                            alignment: Alignment.centerLeft,
                            margin: const EdgeInsets.only(top: 10, bottom: 20),
                            height: 51,
                            padding: const EdgeInsets.symmetric(horizontal: 30),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: const Color(0xffC0BACE), width: 1.5),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(10))),
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              initialValue: '',
                              onFieldSubmitted: (input) {
                                setState(() {
                                  amount = input;
                                });
                              },
                              decoration: const InputDecoration(
                                // labelText: 'Email address',
                                border: InputBorder.none,
                                labelStyle: TextStyle(color: Colors.grey),
                                // errorText: validmail(email),
                              ),
                            )),
                        InkWell(
                            onTap: () {},
                            child: design.longButton(width, 'Withdraw')),
                      ],
                    ),
                  ),
                ),
                Container(
                    decoration: const BoxDecoration(color: Color(0xffF4F4F4)),
                    margin: const EdgeInsets.symmetric(vertical: 20),
                    padding: const EdgeInsets.fromLTRB(25, 10, 25, 10),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Withdrawal Account',
                                style: TextStyle(
                                    color: Color(0xff737373),
                                    fontSize: 10,
                                    fontWeight: FontWeight.w400)),
                            design.hspacer(10),
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  design.title('00194958938'),
                                  GestureDetector(
                                    onTap: () {
                                      showGeneralDialog(
                                          context: context,
                                          pageBuilder: (BuildContext context,
                                              Animation animation,
                                              Animation secondaryAnimation) {
                                            return Dialog(
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20.0)),
                                                child: Container(
                                                    height: 320,
                                                    width: width - 50,
                                                    alignment: Alignment.center,
                                                    child: Column(
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .symmetric(
                                                                  vertical:
                                                                      30.0),
                                                          child: Container(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(30),
                                                              decoration:
                                                                  const BoxDecoration(
                                                                      image:
                                                                          DecorationImage(
                                                                image: AssetImage(
                                                                    'assets/Star 15.png'),
                                                              )),
                                                              child: Image.asset(
                                                                  'assets/question.png')),
                                                        ),
                                                        design.title(
                                                            'Kindly confirm this action'),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  top: 20,
                                                                  bottom: 30),
                                                          child: SizedBox(
                                                            width: 214,
                                                            child: RichText(
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              text: TextSpan(
                                                                style: TextStyle(
                                                                    color: design
                                                                        .numb,
                                                                    fontSize:
                                                                        10,
                                                                    fontFamily:
                                                                        'Moderat',
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500),
                                                                children: <
                                                                    TextSpan>[
                                                                  const TextSpan(
                                                                    text:
                                                                        'Are you sure you want to withdraw',
                                                                  ),
                                                                  // design.naira(design.blue, 10.0),
                                                                  TextSpan(
                                                                      text:
                                                                          ' N200,000',
                                                                      style: TextStyle(
                                                                          color:
                                                                              design.blue)),
                                                                  const TextSpan(
                                                                    text:
                                                                        ' from your account into',
                                                                  ),
                                                                  TextSpan(
                                                                      text:
                                                                          ' 909388375623 Access Bank',
                                                                      style: TextStyle(
                                                                          color:
                                                                              design.blue)),
                                                                  const TextSpan(
                                                                    text: '?',
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceAround,
                                                          children: [
                                                            TextButton(
                                                                onPressed: () {
                                                                  Navigator.of(
                                                                          context)
                                                                      .pop();
                                                                },
                                                                child:
                                                                    const Text(
                                                                  'Cancel',
                                                                  style: TextStyle(
                                                                      color: Color(
                                                                          0xffFF4848),
                                                                      fontSize:
                                                                          15,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500),
                                                                )),
                                                            GestureDetector(
                                                              onTap: () {
                                                                Navigator.of(
                                                                        context)
                                                                    .pop();
                                                                addaccount(
                                                                    context,
                                                                    width,
                                                                    design);
                                                              },
                                                              child: design
                                                                  .longButton(
                                                                      169.0,
                                                                      'Confirm'),
                                                            )
                                                          ],
                                                        )
                                                      ],
                                                    )));
                                          });
                                    },
                                    child: Text('Change',
                                        style: TextStyle(
                                            fontSize: 12.0,
                                            decorationColor: design.blue,
                                            decoration:
                                                TextDecoration.underline,
                                            fontWeight: FontWeight.w400,
                                            color: design.blue)),
                                  )
                                ]),
                            design.hspacer(10),
                            RichText(
                              text: TextSpan(
                                style: const TextStyle(
                                    color: Color(0xff737373),
                                    fontSize: 10,
                                    fontFamily: 'Moderat',
                                    fontWeight: FontWeight.w400),
                                children: <TextSpan>[
                                  const TextSpan(
                                    text: 'Adekanye West Dotun ',
                                  ),
                                  // design.naira(design.blue, 10.0),
                                  TextSpan(
                                      text: '. ',
                                      style: TextStyle(color: design.blue)),
                                  const TextSpan(
                                      text: 'Access Bank',
                                      style: TextStyle(
                                          fontSize: 8,
                                          color: Color(0xff000000))),
                                ],
                              ),
                            ),
                            const Text('1909 2890 XXXX XX83',
                                style: TextStyle(
                                    fontSize: 8, color: Color(0xff000000)))
                          ]),
                    )),
                Padding(
                  padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
                  child: Row(
                    children: [
                      design.title('Previous Withdrawals'),
                      const Spacer(),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
                            return const Withdrawalhistory();
                          }));
                        },
                        child: Text('View all',
                            style: TextStyle(
                                fontSize: 12.0,
                                decorationColor: design.blue,
                                decoration: TextDecoration.underline,
                                fontWeight: FontWeight.w400,
                                color: design.blue)),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(25, 10, 25, 10),
                  child: Column(
                    children: List.generate(
                        withdrawinfo.length,
                        (index) => Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 10.0, bottom: 3),
                                  child: Text(withdrawinfo[index].date,
                                      style: TextStyle(
                                          fontSize: 7,
                                          color: design.numb,
                                          fontWeight: FontWeight.w500)),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 3.0, bottom: 10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          design.naira(design.darkPurple, 15.0),
                                          Text(withdrawinfo[index].amount,
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  color: design.darkPurple,
                                                  fontWeight: FontWeight.w500))
                                        ],
                                      ),
                                      Container(
                                        width: 136,
                                        alignment: Alignment.center,
                                        height: 24,
                                        // padding: const EdgeInsets.fromLTRB(30, 5, 30, 5),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(25),
                                            color: withdrawinfo[index].mode ==
                                                    'Pending'
                                                ? const Color(0xffFFB800)
                                                    .withOpacity(0.3)
                                                : withdrawinfo[index].mode ==
                                                        'Successful'
                                                    ? const Color(0xff00BA07)
                                                        .withOpacity(0.3)
                                                    : const Color(0xffCE2E2E)
                                                        .withOpacity(0.3)),
                                        child: Text(withdrawinfo[index].mode,
                                            style: TextStyle(
                                                fontSize: 10,
                                                fontWeight: FontWeight.w500,
                                                color: withdrawinfo[index]
                                                            .mode ==
                                                        'Pending'
                                                    ? const Color(0xffFFB800)
                                                    : withdrawinfo[index]
                                                                .mode ==
                                                            'Successful'
                                                        ? const Color(
                                                            0xff00BA07)
                                                        : const Color(
                                                            0xffCE2E2E))),
                                      )
                                    ],
                                  ),
                                ),
                                const Divider(),
                              ],
                            )),
                  ),
                ),
              ],
            ),
          )
        ]),
      ),
    ));
  }

  Future<dynamic> addaccount(BuildContext context, double width, Ui design) {
    return showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30))),
        builder: (BuildContext context) {
          return SizedBox(
              width: width,
              height: 389,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(25, 30, 25, 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Choose Account',
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w500,
                          color: design.blue),
                    ),
                    const Divider(),
                    Column(
                        children: List.generate(
                            2,
                            (index) => Container(
                                width: width,
                                margin: const EdgeInsets.symmetric(vertical: 5),
                                height: 82,
                                decoration: BoxDecoration(
                                    color: const Color(0xffF8F8FA),
                                    borderRadius: BorderRadius.circular(5)),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Image.asset('assets/access.png'),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          '1909 2890 XXXX XX83',
                                          style: TextStyle(
                                              fontSize: 20.0,
                                              fontWeight: FontWeight.w500,
                                              color: design.ash),
                                        ),
                                        Image.asset('assets/Mastercard.png'),
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
                                              style: TextStyle(
                                                  color: Color(0xff737373))),
                                        ],
                                      ),
                                    ),
                                  ],
                                )))),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                        addaccountform(context, width, design);
                      },
                      child: design.longoutlineButton(
                          width, 'Add New Bank Account'),
                    )
                  ],
                ),
              ));
        });
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
                        setState(() {
                          added = true;
                        });
                      },
                      child: design.longButton(width, 'Add'),
                    )
                  ],
                ),
              ));
        });
  }
}
