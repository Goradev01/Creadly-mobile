import 'package:creadlymobile/View/style.dart';
import 'package:flutter/material.dart';

class Bnpl extends StatefulWidget {
  const Bnpl({Key? key}) : super(key: key);

  @override
  State<Bnpl> createState() => _BnplState();
}

class Withdraw {
  String amount;
  String date;
  String mode;
  Withdraw({required this.amount, required this.date, required this.mode});
}

class _BnplState extends State<Bnpl> {
  String amount = '';
  String cardNumber = '';
  String pin = '';
  String cv2 = '';
  bool added = false;
  String expiryDate = '';
  List<Withdraw> withdrawinfo = [
    Withdraw(
        amount: '200,000', date: '22, May 2022', mode: 'Awaiting Approval'),
    Withdraw(amount: '200,000', date: '22, May 2022', mode: 'Approved Loan'),
    Withdraw(amount: '200,000', date: '22, May 2022', mode: 'Declined Request'),
    Withdraw(
        amount: '200,000', date: '22, May 2022', mode: 'Awaiting Approval'),
    Withdraw(amount: '200,000', date: '22, May 2022', mode: 'Approved Loan'),
  ];
  @override
  Widget build(BuildContext context) {
    final design = Ui();
    final width = MediaQuery.of(context).size.width;
    return design.layout(SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 25),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                design.title('BNPL Advance'),
              ],
            ),
          ),
          Center(
            child: Container(
                width: width - 50,
                padding: const EdgeInsets.symmetric(vertical: 11.5),
                height: 100,
                decoration: BoxDecoration(
                  color: design.shadenew,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(child: design.smalltext('Wallet Balance')),
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
                          Text('200,000',
                              style: TextStyle(
                                fontSize: 32,
                                color: design.blue,
                                fontWeight: FontWeight.w700,
                                decorationColor: design.blue,
                              ))
                        ],
                      ),
                    ])),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(25, 10, 25, 10),
            child: RichText(
              text: TextSpan(
                style: TextStyle(
                    color: design.numb,
                    fontSize: 10,
                    fontFamily: 'Moderat',
                    fontWeight: FontWeight.w500),
                children: <TextSpan>[
                  const TextSpan(
                    text: 'Wallet Balance: ',
                  ),
                  // design.naira(design.blue, 10.0),
                  TextSpan(
                      text: '70,000', style: TextStyle(color: design.blue)),
                ],
              ),
            ),
          ),
          Form(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(25, 10, 25, 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  design.smalltext('Request Amount'),
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
                      onTap: () {}, child: design.longButton(width, 'Request')),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
            child: design.title('Previous Requests'),
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                      borderRadius: BorderRadius.circular(25),
                                      color: withdrawinfo[index].mode ==
                                              'Awaiting Approval'
                                          ? const Color(0xffFFB800)
                                              .withOpacity(0.3)
                                          : withdrawinfo[index].mode ==
                                                  'Approved Loan'
                                              ? const Color(0xff00BA07)
                                                  .withOpacity(0.3)
                                              : const Color(0xffCE2E2E)
                                                  .withOpacity(0.3)),
                                  child: Text(withdrawinfo[index].mode,
                                      style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w500,
                                          color: withdrawinfo[index].mode ==
                                                  'Awaiting Approval'
                                              ? const Color(0xffFFB800)
                                              : withdrawinfo[index].mode ==
                                                      'Approved Loan'
                                                  ? const Color(0xff00BA07)
                                                  : const Color(0xffCE2E2E))),
                                )
                              ],
                            ),
                          ),
                          const Divider(),
                        ],
                      )),
            ),
          )
        ]),
      ),
    ));
  }
}
