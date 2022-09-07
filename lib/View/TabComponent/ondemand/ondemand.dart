import 'package:creadlymobile/Provider/bankprovider.dart';
import 'package:creadlymobile/View/TabComponent/Salary-Advanced/withdrawalhistory.dart';
import 'package:creadlymobile/View/style.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

import '../../../Model/Core/banklist.dart';
import '../../../Model/Core/withdraw.dart';
import '../../../Provider/withdrawprovider.dart';

class Ondemand extends StatefulWidget {
  final String amount;
  const Ondemand({Key? key, required this.amount}) : super(key: key);

  @override
  State<Ondemand> createState() => _OndemandState();
}

class Withdraw {
  String amount;
  String date;
  String mode;
  Withdraw({required this.amount, required this.date, required this.mode});
}

class _OndemandState extends State<Ondemand> {
  String amount = '';
  String accountNumber = '';
  String accountName = '';
  String pin = '';
  String cv2 = '';
  bool added = true;
  Stream<List<BankList>>? bankList;
  List<String> bankDetail = ['ade', 'boy'];
  String expiryDate = '';
  List<Withdraw> withdrawinfo = [
    Withdraw(amount: '200,000', date: '22, May 2022', mode: 'Pending'),
    Withdraw(amount: '200,000', date: '22, May 2022', mode: 'Successful'),
    Withdraw(amount: '200,000', date: '22, May 2022', mode: 'UnSuccessful'),
  ];

  List<DropdownMenuItem<List<String>>>? bankption;
  Stream<List<WithdrawData>>? streamWithdraw;
  @override
  void initState() {
    super.initState();
    bankList = Provider.of<BankProvider>(context, listen: false).getbankList();
    streamWithdraw =
        Provider.of<WithdrawProvider>(context, listen: false).getWithdrawData();
    // Provider.of<BankProvider>(context, listen: false)
    //     .getBankList()
    //     .then((value) async {
    //   List<DropdownMenuItem<List<String>>> data =
    //       List.generate(value.length, (index) {
    //     String name = value[index].name!;
    //     String id = value[index].id!.toString();
    //     return DropdownMenuItem<List<String>>(
    //         value: [name, id], child: Text(value[index].name!));
    //   });
    //   bankption = data;
    // });
  }

  @override
  Widget build(BuildContext context) {
    final design = Ui();
    final width = MediaQuery.of(context).size.width;
    return design.layout(SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 25),
        child:
            Consumer<WithdrawProvider>(builder: (context, withdrawData, child) {
          return StreamBuilder<List<WithdrawData>>(
              stream: streamWithdraw,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.active) {
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(25, 0, 25, 10),
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
                            Shimmer.fromColors(
                                baseColor: const Color(0xFFEBEBF4),
                                highlightColor:
                                    const Color(0xFFEBEBF4).withOpacity(0.1),
                                // loop: 5,
                                enabled: true,
                                // period: const Duration(milliseconds: 1500),
                                child: Container(
                                  height: 18,
                                  width: 100,
                                  decoration: BoxDecoration(
                                    color: const Color(0xffFfFfFf),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                )),
                          ],
                        ),
                        Shimmer.fromColors(
                            baseColor: const Color(0xFFEBEBF4),
                            highlightColor:
                                const Color(0xFFEBEBF4).withOpacity(0.1),
                            // loop: 5,
                            enabled: true,
                            // period: const Duration(milliseconds: 1500),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              height: 136,
                            )),
                        design.hspacer(10),
                        Row(
                          children: [
                            Shimmer.fromColors(
                                baseColor: const Color(0xFFEBEBF4),
                                highlightColor:
                                    const Color(0xFFEBEBF4).withOpacity(0.1),
                                // loop: 5,
                                enabled: true,
                                // period: const Duration(milliseconds: 1500),
                                child: Container(
                                  height: 18,
                                  width: 100,
                                  decoration: const BoxDecoration(
                                    color: Color(0xffFfFfFf),
                                  ),
                                )),
                            const Spacer(),
                            Shimmer.fromColors(
                                baseColor: const Color(0xFFEBEBF4),
                                highlightColor:
                                    const Color(0xFFEBEBF4).withOpacity(0.1),
                                // loop: 5,
                                enabled: true,
                                // period: const Duration(milliseconds: 1500),
                                child: Container(
                                  height: 18,
                                  width: 100,
                                  decoration: const BoxDecoration(
                                    color: Color(0xffFfFfFf),
                                  ),
                                )),
                          ],
                        ),
                        design.hspacer(10),
                        Column(
                          children: List.generate(
                            4,
                            (index) => Shimmer.fromColors(
                                baseColor: const Color(0xFFEBEBF4),
                                highlightColor:
                                    const Color(0xFFEBEBF4).withOpacity(0.1),
                                // loop: 5,
                                enabled: true,
                                // period: const Duration(milliseconds: 1500),
                                child: Container(
                                  height: 50,
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 3),
                                  decoration: const BoxDecoration(
                                    color: Color(0xffFfFfFf),
                                  ),
                                )),
                          ),
                        )
                      ],
                    ),
                  );
                }
                if (snapshot.connectionState == ConnectionState.done) {
                  final data = snapshot.data!;

                  return Column(children: [
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
                          design.title('Ondemand'),
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      const Expanded(child: SizedBox()),
                                      Expanded(
                                          child: Center(
                                              child: design.smalltext(
                                                  'Amount Loanable'))),
                                      Expanded(
                                          child: Align(
                                              alignment: Alignment.topCenter,
                                              child: Image.asset(
                                                  'assets/yellowerror.png'))),
                                    ],
                                  )),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('N',
                                      style: TextStyle(
                                          fontSize: 33,
                                          color: design.blue,
                                          decorationStyle:
                                              TextDecorationStyle.double,
                                          decorationColor: design.blue,
                                          decoration:
                                              TextDecoration.lineThrough)),
                                  Text(widget.amount,
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
                                          borderRadius:
                                              BorderRadius.circular(2.5)),
                                      child: Container(
                                          height: 5,
                                          width: (width * 0.6) * 0.9,
                                          decoration: const BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.horizontal(
                                                      left:
                                                          Radius.circular(2.5)),
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
                                    text: '70,000',
                                    style: TextStyle(color: design.blue)),
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
                    //!edit
                    Padding(
                      padding: const EdgeInsets.fromLTRB(25, 50, 25, 10),
                      child: Visibility(
                          visible: data.isEmpty,
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
                    //!edit
                    Visibility(
                      visible: data.isNotEmpty,
                      child: Column(
                        children: [
                          Form(
                            child: Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(25, 10, 25, 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  design.smalltext('Amount'),
                                  Container(
                                      width: width,
                                      alignment: Alignment.centerLeft,
                                      margin: const EdgeInsets.only(
                                          top: 10, bottom: 20),
                                      height: 51,
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
                                        initialValue: '',
                                        onChanged: (input) {
                                          setState(() {
                                            amount = input;
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
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 25),
                                child: InkWell(
                                    onTap: () {
                                      Map body = {
                                        "amount": 10000,
                                        "type": "salaryAdvance",
                                        "account": {
                                          "accountNumber": "0161846863",
                                          "bank": "Guaranty Trust Bank",
                                          "bankCode": "058",
                                          "accountName": "Mayowa Oladunjoye"
                                        }
                                      };
                                      Provider.of<WithdrawProvider>(context,
                                              listen: false)
                                          .postWithdraw(body);
                                    },
                                    child:
                                        design.longButton(width, 'Withdraw')),
                              ),
                              Container(
                                  decoration: const BoxDecoration(
                                      color: Color(0xffF4F4F4)),
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 20),
                                  padding:
                                      const EdgeInsets.fromLTRB(25, 10, 25, 10),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text('Withdrawal Account',
                                              style: TextStyle(
                                                  color: Color(0xff737373),
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.w400)),
                                          design.hspacer(10),
                                          Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                design.title(data[0]
                                                    .account!['accountNumber']),
                                                GestureDetector(
                                                  onTap: () {
                                                    showGeneralDialog(
                                                        context: context,
                                                        pageBuilder: (BuildContext
                                                                context,
                                                            Animation animation,
                                                            Animation
                                                                secondaryAnimation) {
                                                          return Dialog(
                                                              shape: RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              20.0)),
                                                              child: Container(
                                                                  height: 320,
                                                                  width: width -
                                                                      50,
                                                                  alignment:
                                                                      Alignment
                                                                          .center,
                                                                  child: Column(
                                                                    children: [
                                                                      Padding(
                                                                        padding:
                                                                            const EdgeInsets.symmetric(vertical: 30.0),
                                                                        child: Container(
                                                                            padding: const EdgeInsets.all(30),
                                                                            decoration: const BoxDecoration(
                                                                                image: DecorationImage(
                                                                              image: AssetImage('assets/Star 15.png'),
                                                                            )),
                                                                            child: Image.asset('assets/question.png')),
                                                                      ),
                                                                      design.title(
                                                                          'Kindly confirm this action'),
                                                                      Padding(
                                                                        padding: const EdgeInsets.only(
                                                                            top:
                                                                                20,
                                                                            bottom:
                                                                                30),
                                                                        child:
                                                                            SizedBox(
                                                                          width:
                                                                              214,
                                                                          child:
                                                                              RichText(
                                                                            textAlign:
                                                                                TextAlign.center,
                                                                            text:
                                                                                TextSpan(
                                                                              style: TextStyle(color: design.numb, fontSize: 10, fontFamily: 'Moderat', fontWeight: FontWeight.w500),
                                                                              children: <TextSpan>[
                                                                                const TextSpan(
                                                                                  text: 'Are you sure you want to withdraw',
                                                                                ),
                                                                                // design.naira(design.blue, 10.0),
                                                                                TextSpan(text: amount, style: TextStyle(color: design.blue)),
                                                                                const TextSpan(
                                                                                  text: ' from your account into',
                                                                                ),
                                                                                TextSpan(text: '${data[0].account!['accountNumber']} ${data[0].account!['bank']}', style: TextStyle(color: design.blue)),
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
                                                                            MainAxisAlignment.spaceAround,
                                                                        children: [
                                                                          TextButton(
                                                                              onPressed: () {
                                                                                Navigator.of(context).pop();
                                                                              },
                                                                              child: const Text(
                                                                                'Cancel',
                                                                                style: TextStyle(color: Color(0xffFF4848), fontSize: 15, fontWeight: FontWeight.w500),
                                                                              )),
                                                                          GestureDetector(
                                                                            onTap:
                                                                                () {
                                                                              Navigator.of(context).pop();
                                                                              addaccount(context, width, design);
                                                                            },
                                                                            child:
                                                                                design.longButton(169.0, 'Confirm'),
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
                                                          decorationColor:
                                                              design.blue,
                                                          decoration:
                                                              TextDecoration
                                                                  .underline,
                                                          fontWeight:
                                                              FontWeight.w400,
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
                                                TextSpan(
                                                  text: data[0]
                                                      .account!["accountName"],
                                                ),
                                                // design.naira(design.blue, 10.0),
                                                TextSpan(
                                                    text: '. ',
                                                    style: TextStyle(
                                                        color: design.blue)),
                                                TextSpan(
                                                    text: data[0]
                                                        .account!["bank"],
                                                    style: const TextStyle(
                                                        fontSize: 8,
                                                        color:
                                                            Color(0xff000000))),
                                              ],
                                            ),
                                          ),
                                          Text(
                                              data[0].account!["accountNumber"],
                                              style: const TextStyle(
                                                  fontSize: 8,
                                                  color: Color(0xff000000)))
                                        ]),
                                  )),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
                            child: Row(
                              children: [
                                design.title('Previous Withdrawals'),
                                const Spacer(),
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(builder: (context) {
                                      return Withdrawalhistory(data: data);
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
                                  data.length,
                                  (index) => Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          // Padding(
                                          //   padding: const EdgeInsets.only(
                                          //       top: 10.0, bottom: 3),
                                          //   child: Text(data[index].createdAt!,
                                          //       style: TextStyle(
                                          //           fontSize: 7,
                                          //           color: design.numb,
                                          //           fontWeight: FontWeight.w500)),
                                          // ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 3.0, bottom: 10),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  children: [
                                                    design.naira(
                                                        design.darkPurple,
                                                        15.0),
                                                    Text(
                                                        data[index]
                                                            .amount!
                                                            .toString(),
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            color: design
                                                                .darkPurple,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500))
                                                  ],
                                                ),
                                                Container(
                                                  width: 136,
                                                  alignment: Alignment.center,
                                                  height: 24,
                                                  // padding: const EdgeInsets.fromLTRB(30, 5, 30, 5),
                                                  decoration: BoxDecoration(
                                                      borderRadius: BorderRadius
                                                          .circular(25),
                                                      color: data[index]
                                                                  .status ==
                                                              1
                                                          ? const Color(
                                                                  0xffFFB800)
                                                              .withOpacity(0.3)
                                                          : data[index]
                                                                      .status ==
                                                                  2
                                                              ? const Color(
                                                                      0xff00BA07)
                                                                  .withOpacity(
                                                                      0.3)
                                                              : const Color(
                                                                      0xffCE2E2E)
                                                                  .withOpacity(
                                                                      0.3)),
                                                  child: Text(
                                                      data[index].status == 1
                                                          ? 'Pending'
                                                          : data[index]
                                                                      .status ==
                                                                  2
                                                              ? 'Succussfull'
                                                              : 'Unsuccessfull',
                                                      style: TextStyle(
                                                          fontSize: 10,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: data[index]
                                                                      .status ==
                                                                  1
                                                              ? const Color(
                                                                  0xffFFB800)
                                                              : data[index]
                                                                          .status ==
                                                                      2
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
                  ]);
                } else {
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(25, 0, 25, 10),
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
                            Shimmer.fromColors(
                                baseColor: const Color(0xFFEBEBF4),
                                highlightColor:
                                    const Color(0xFFEBEBF4).withOpacity(0.1),
                                // loop: 5,
                                enabled: true,
                                // period: const Duration(milliseconds: 1500),
                                child: Container(
                                  height: 18,
                                  width: 100,
                                  decoration: BoxDecoration(
                                    color: const Color(0xffFfFfFf),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                )),
                          ],
                        ),
                        Shimmer.fromColors(
                            baseColor: const Color(0xFFEBEBF4),
                            highlightColor:
                                const Color(0xFFEBEBF4).withOpacity(0.1),
                            // loop: 5,
                            enabled: true,
                            // period: const Duration(milliseconds: 1500),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              height: 136,
                            )),
                        design.hspacer(10),
                        Row(
                          children: [
                            Shimmer.fromColors(
                                baseColor: const Color(0xFFEBEBF4),
                                highlightColor:
                                    const Color(0xFFEBEBF4).withOpacity(0.1),
                                // loop: 5,
                                enabled: true,
                                // period: const Duration(milliseconds: 1500),
                                child: Container(
                                  height: 18,
                                  width: 100,
                                  decoration: const BoxDecoration(
                                    color: Color(0xffFfFfFf),
                                  ),
                                )),
                            const Spacer(),
                            Shimmer.fromColors(
                                baseColor: const Color(0xFFEBEBF4),
                                highlightColor:
                                    const Color(0xFFEBEBF4).withOpacity(0.1),
                                // loop: 5,
                                enabled: true,
                                // period: const Duration(milliseconds: 1500),
                                child: Container(
                                  height: 18,
                                  width: 100,
                                  decoration: const BoxDecoration(
                                    color: Color(0xffFfFfFf),
                                  ),
                                )),
                          ],
                        ),
                        design.hspacer(10),
                        Column(
                          children: List.generate(
                            4,
                            (index) => Shimmer.fromColors(
                                baseColor: const Color(0xFFEBEBF4),
                                highlightColor:
                                    const Color(0xFFEBEBF4).withOpacity(0.1),
                                // loop: 5,
                                enabled: true,
                                // period: const Duration(milliseconds: 1500),
                                child: Container(
                                  height: 50,
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 3),
                                  decoration: const BoxDecoration(
                                    color: Color(0xffFfFfFf),
                                  ),
                                )),
                          ),
                        )
                      ],
                    ),
                  );
                }
              });
        }),
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
                                    // Image.asset('assets/access.png'),
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
                                        // Image.asset('assets/Mastercard.png'),
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
          return StatefulBuilder(builder: (context, StateSetter setState) {
            return StreamBuilder<List<BankList>>(
                stream: bankList,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.active) {
                    return design.loadingProgress();
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return design.loadingProgress();
                  }
                  if (snapshot.connectionState == ConnectionState.done) {
                    return SizedBox(
                        width: width,
                        height: 430,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(25, 30, 25, 30),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Add Bank Account',
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
                                    design.smalltext('Account Name'),
                                    Container(
                                        width: width,
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
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(10))),
                                        child: TextFormField(
                                          keyboardType: TextInputType.number,
                                          onChanged: (input) {
                                            setState(() {
                                              accountName = input;
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
                                    design.smalltext('Account Number'),
                                    Container(
                                        width: width,
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
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(10))),
                                        child: TextFormField(
                                          keyboardType: TextInputType.number,
                                          onChanged: (input) {
                                            setState(() {
                                              accountNumber = input;
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
                                    // Row(
                                    //   children: [
                                    //     Column(
                                    //       crossAxisAlignment: CrossAxisAlignment.start,
                                    //       children: [
                                    //         design.smalltext('Expiry Date'),
                                    //         Container(
                                    //             width: (width / 2) - 70,
                                    //             alignment: Alignment.centerLeft,
                                    //             margin: const EdgeInsets.only(
                                    //                 top: 10, bottom: 10),
                                    //             height: 40,
                                    //             padding: const EdgeInsets.symmetric(
                                    //                 horizontal: 30),
                                    //             decoration: BoxDecoration(
                                    //                 border: Border.all(
                                    //                     color: const Color(0xffC0BACE),
                                    //                     width: 1.5),
                                    //                 borderRadius: const BorderRadius.all(
                                    //                     Radius.circular(10))),
                                    //             child: TextFormField(
                                    //               keyboardType: TextInputType.number,
                                    //               onChanged: (input) {
                                    //                 setState(() {
                                    //                   expiryDate = input;
                                    //                 });
                                    //               },
                                    //               decoration: const InputDecoration(
                                    //                 // labelText: 'Email address',
                                    //                 border: InputBorder.none,
                                    //                 labelStyle:
                                    //                     TextStyle(color: Colors.grey),
                                    //                 // errorText: validmail(email),
                                    //               ),
                                    //             )),
                                    //       ],
                                    //     ),
                                    //     const Spacer(),
                                    //     Column(
                                    //       crossAxisAlignment: CrossAxisAlignment.start,
                                    //       children: [
                                    //         design.smalltext('CVV2'),
                                    //         Container(
                                    //             width: (width / 2) - 70,
                                    //             alignment: Alignment.centerLeft,
                                    //             margin: const EdgeInsets.only(
                                    //                 top: 10, bottom: 10),
                                    //             height: 40,
                                    //             padding: const EdgeInsets.symmetric(
                                    //                 horizontal: 30),
                                    //             decoration: BoxDecoration(
                                    //                 border: Border.all(
                                    //                     color: const Color(0xffC0BACE),
                                    //                     width: 1.5),
                                    //                 borderRadius: const BorderRadius.all(
                                    //                     Radius.circular(10))),
                                    //             child: TextFormField(
                                    //               keyboardType: TextInputType.number,
                                    //               onChanged: (input) {
                                    //                 setState(() {
                                    //                   cv2 = input;
                                    //                 });
                                    //               },
                                    //               decoration: const InputDecoration(
                                    //                 // labelText: 'Email address',
                                    //                 border: InputBorder.none,
                                    //                 labelStyle:
                                    //                     TextStyle(color: Colors.grey),
                                    //                 // errorText: validmail(email),
                                    //               ),
                                    //             )),
                                    //       ],
                                    //     ),
                                    //   ],
                                    // ),
                                    design.smalltext('Choose bank'),
                                    Builder(builder: (context) {
                                      final value = snapshot.data!;
                                      List<DropdownMenuItem<List<String>>>
                                          data =
                                          List.generate(value.length, (index) {
                                        String name = value[index].name!;
                                        String id = value[index].id!.toString();
                                        return DropdownMenuItem<List<String>>(
                                            value: [name, id],
                                            child: Text(value[index].name!));
                                      });
                                      return Container(
                                          width: width,
                                          alignment: Alignment.centerLeft,
                                          margin: const EdgeInsets.only(
                                              top: 10, bottom: 10),
                                          height: 40,
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 15),
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color:
                                                      const Color(0xffC0BACE),
                                                  width: 1.5),
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(10))),
                                          child: Row(
                                            children: [
                                              Expanded(
                                                  child: design.smalltext(
                                                      bankDetail[0])),
                                              const Spacer(),
                                              Expanded(
                                                flex: 1,
                                                child: DropdownButton<
                                                        List<String>>(
                                                    underline: const SizedBox(),
                                                    isExpanded: true,
                                                    icon: Transform.rotate(
                                                        angle: 55,
                                                        child: Icon(
                                                            Icons
                                                                .arrow_back_ios,
                                                            size: 10,
                                                            color: design
                                                                .darkPurple)),
                                                    items: List.generate(
                                                        value.length, (index) {
                                                      String name =
                                                          value[index].name!;
                                                      String id = value[index]
                                                          .id!
                                                          .toString();
                                                      return DropdownMenuItem<
                                                              List<String>>(
                                                          value: [name, id],
                                                          child: Text(
                                                              value[index]
                                                                  .name!));
                                                    }),
                                                    onChanged:
                                                        (List<String>? val) {
                                                      setState(() {
                                                        bankDetail = val!;
                                                      });
                                                    }),
                                              ),
                                            ],
                                          ));
                                    }),
                                  ],
                                ),
                              ),
                              const Spacer(),
                              GestureDetector(
                                onTap: () {
                                  Map verifyBody = {
                                    "accountNumber": accountNumber,
                                    "bankCode": bankDetail[1]
                                  };
                                  Map body = {
                                    "accountName": accountName,
                                    "accountNumber": accountNumber,
                                    "bank": bankDetail[0],
                                    "bankCode": bankDetail[1]
                                  };
                                  Provider.of<BankProvider>(context,
                                          listen: false)
                                      .verifyBank(verifyBody, body);
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
                  } else {
                    return design.loadingProgress();
                  }
                });
          });
        });
  }
}
