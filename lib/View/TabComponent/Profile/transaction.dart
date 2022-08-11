import 'package:creadlymobile/View/style.dart';
import 'package:flutter/material.dart';

class Transaction extends StatefulWidget {
  const Transaction({Key? key}) : super(key: key);

  @override
  State<Transaction> createState() => _TransactionState();
}

class Withdraw {
  String amount;
  String date;
  String mode;
  Withdraw({required this.amount, required this.date, required this.mode});
}

class _TransactionState extends State<Transaction> {
  bool tabclick = true;
  String amount = '';
  String cardNumber = '';
  String pin = '';
  String cv2 = '';
  String expiryDate = '';
  List<Withdraw> bnpl = [
    Withdraw(amount: '200,000', date: '22, May 2022', mode: 'Successful'),
    Withdraw(amount: '200,000', date: '22, May 2022', mode: 'Pending'),
    Withdraw(amount: '200,000', date: '22, May 2022', mode: 'Successful'),
    Withdraw(amount: '200,000', date: '22, May 2022', mode: 'Pending'),
    Withdraw(amount: '200,000', date: '22, May 2022', mode: 'Failed'),
    Withdraw(amount: '200,000', date: '22, May 2022', mode: 'Pending'),
    Withdraw(amount: '200,000', date: '22, May 2022', mode: 'Failed'),
  ];
  List<Withdraw> salary = [
    Withdraw(amount: '200,000', date: '22, May 2022', mode: 'Successful'),
    Withdraw(amount: '200,000', date: '22, May 2022', mode: 'Failed'),
    Withdraw(amount: '200,000', date: '22, May 2022', mode: 'Pending'),
    Withdraw(amount: '200,000', date: '22, May 2022', mode: 'Failed'),
    Withdraw(amount: '200,000', date: '22, May 2022', mode: 'Successful'),
    Withdraw(amount: '200,000', date: '22, May 2022', mode: 'Pending'),
    Withdraw(amount: '200,000', date: '22, May 2022', mode: 'Failed'),
  ];
  Widget amountnaira(color, double size, text, weight) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('N',
            style: TextStyle(
                fontSize: size,
                color: color,
                decorationStyle: TextDecorationStyle.double,
                decorationColor: color,
                decoration: TextDecoration.lineThrough)),
        Text(text,
            style: TextStyle(
              fontSize: size,
              color: color,
              fontWeight: weight,
              decorationColor: color,
            ))
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final design = Ui();
    final width = MediaQuery.of(context).size.width;
    return design.layout(SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 25, 0, 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
              child: Column(
                children: [
                  design.backnav(context, 'Payment'),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            tabclick = true;
                          });
                        },
                        child: Container(
                          width: (width - 50) / 2,
                          height: 40,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: tabclick
                                ? Colors.white
                                : const Color(0xffF8F8FA),
                          ),
                          child: tabclick
                              ? design.smallineartext('BNPL Payments', 11)
                              : design.input(design.numb, 11, 'BNPL Payments',
                                  FontWeight.w500),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            tabclick = false;
                          });
                        },
                        child: Container(
                          width: (width - 50) / 2,
                          height: 40,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: !tabclick
                                ? Colors.white
                                : const Color(0xffF8F8FA),
                          ),
                          child: !tabclick
                              ? design.smallineartext('Salary Advance', 11)
                              : design.input(design.numb, 11, 'Salary Advance',
                                  FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
                  design.hspacer(15),
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
                            'Total Debt',
                            style: TextStyle(
                                color: design.ash,
                                fontSize: 10,
                                fontWeight: FontWeight.w500),
                          ),
                          Center(
                            child: amountnaira(
                                design.blue, 32, "200,000", FontWeight.w700),
                          )
                        ],
                      )),
                ],
              ),
            ),
            design.hspacer(15),
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          vertical: 30.0),
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
                                                          const EdgeInsets.only(
                                                              top: 20,
                                                              bottom: 30),
                                                      child: SizedBox(
                                                        width: 214,
                                                        child: RichText(
                                                          textAlign:
                                                              TextAlign.center,
                                                          text: TextSpan(
                                                            style: TextStyle(
                                                                color:
                                                                    design.numb,
                                                                fontSize: 10,
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
                                                                      color: design
                                                                          .blue)),
                                                              const TextSpan(
                                                                text:
                                                                    ' from your account into',
                                                              ),
                                                              TextSpan(
                                                                  text:
                                                                      ' 909388375623 Access Bank',
                                                                  style: TextStyle(
                                                                      color: design
                                                                          .blue)),
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
                                                            child: const Text(
                                                              'Cancel',
                                                              style: TextStyle(
                                                                  color: Color(
                                                                      0xffFF4848),
                                                                  fontSize: 15,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500),
                                                            )),
                                                        GestureDetector(
                                                          onTap: () {
                                                            Navigator.of(
                                                                    context)
                                                                .pop();
                                                            addaccount(context,
                                                                width, design);
                                                          },
                                                          child:
                                                              design.longButton(
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
                                        decoration: TextDecoration.underline,
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
                                      fontSize: 8, color: Color(0xff000000))),
                            ],
                          ),
                        ),
                        const Text('1909 2890 XXXX XX83',
                            style: TextStyle(
                                fontSize: 8, color: Color(0xff000000)))
                      ]),
                )),
            Padding(
              padding: const EdgeInsets.fromLTRB(25, 20, 25, 20),
              child: design.title('Previous Withdrawals'),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
              child: Builder(builder: (context) {
                List withdrawinfo = tabclick ? bnpl : salary;
                return Column(
                  children: List.generate(
                      withdrawinfo.length,
                      (index) => Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 10.0, bottom: 3),
                                child: Text(withdrawinfo[index].date,
                                    style: TextStyle(
                                        fontSize: 7,
                                        color: design.numb,
                                        fontWeight: FontWeight.w500)),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 3.0, bottom: 10),
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
                                    Text(withdrawinfo[index].mode,
                                        style: TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.w500,
                                            color: withdrawinfo[index].mode ==
                                                    'Pending'
                                                ? const Color(0xffFFB800)
                                                : withdrawinfo[index].mode ==
                                                        'Successful'
                                                    ? const Color(0xff00BA07)
                                                    : const Color(0xffCE2E2E)))
                                  ],
                                ),
                              ),
                              const Divider(),
                            ],
                          )),
                );
              }),
            ),
          ],
        ),
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
