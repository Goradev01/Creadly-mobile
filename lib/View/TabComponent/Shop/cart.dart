import 'dart:async';

import 'dart:developer';
import 'dart:io';

import 'package:creadlymobile/View/style.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_paystack_payment/flutter_paystack_payment.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  int stock = 0;
  String paystackPublicKey = 'pk_test_cc4c2259b62bc75842e99e60a2e4ac12a883a840';
  bool inProgress = false;
  String? _cardNumber;
  String? _cvv;
  int? _expiryMonth;
  int? _expiryYear;
  PaymentCard _getCardFromUI() {
    // Using just the must-required parameters.
    return PaymentCard(
      number: _cardNumber,
      cvc: _cvv,
      expiryMonth: _expiryMonth,
      expiryYear: _expiryYear,
    );
  }

  String _getReference() {
    log("We are here");
    String platform;
    if (!kIsWeb) {
      if (Platform.isIOS) {
        platform = 'iOS';
      } else if (Platform.isLinux) {
        platform = 'Linux';
      } else if (Platform.isMacOS) {
        platform = 'MacOS';
      } else if (Platform.isFuchsia) {
        platform = 'Fuchsia';
      } else if (Platform.isWindows) {
        platform = 'Windows';
      } else {
        platform = 'Android';
      }
      // platform = 'Unknown';
    } else {
      platform = "WEB";
    }

    return 'ChargedFrom${platform}_${DateTime.now().millisecondsSinceEpoch}';
  }

  handleCheckout(BuildContext context) async {
    // if (_method != CheckoutMethod.card && _isLocal) {
    //   _showMessage('Select server initialization method at the top');
    //   return;
    // }
    // setState(() => inProgress = true);
    // _formKey.currentState?.save();
    Charge charge = Charge()
      ..amount = 1000 + 00 // In base currency
      ..email = 'customer@email.com'
      ..card = _getCardFromUI();

    charge.reference = _getReference();

    try {
      CheckoutResponse response = await plugin.checkout(
        context,
        method: CheckoutMethod.card,
        charge: charge,
        fullscreen: false,
      );
      log('Response = $response');
      setState(() => inProgress = false);
      // _updateStatus(response.reference, '$response');
    } catch (e) {
      setState(() => inProgress = false);
      // _showMessage("Check console for error");
      rethrow;
    }
  }

  final plugin = PaystackPayment();
  @override
  void initState() {
    plugin.initialize(publicKey: paystackPublicKey);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final design = Ui();
    // var confirmbox = confirmbox(context, width, design);
    return design.layout(SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(25, 25, 25, 0),
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
                    design.title('Cart'),
                  ],
                ),
              ),
              Container(
                width: width,
                height: 85,
                // padding: const EdgeInsets.all(5),
                margin: const EdgeInsets.fromLTRB(25, 24, 25, 5),
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                decoration: const BoxDecoration(color: Color(0xfff8f8fa)),
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        'assets/shopicon/imac.jpg',
                        height: 44.82,
                        width: 59.5,
                      ),
                      design.wspacer(5),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          design.smallText('IMac 47 Inches'),
                          design.hspacer(5),
                          Builder(builder: (context) {
                            List<Widget> star = List.filled(
                                4,
                                SvgPicture.asset('assets/shopicon/starhalf.svg',
                                    width: 9.98, height: 9.55),
                                growable: true);
                            List<Widget> replace = List.generate(
                                3,
                                (index) => SvgPicture.asset(
                                    'assets/shopicon/star.svg',
                                    width: 9.98,
                                    height: 9.55));
                            star.replaceRange(0, 3, replace);

                            return Row(
                              children: star,
                            );
                          }),
                          const Spacer(),
                          design.amount(
                              design.ash, 12.0, '500,000', FontWeight.w500)
                        ],
                      ),
                      const Spacer(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text('Remove',
                              style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  decorationColor: design.blue,
                                  fontSize: 10,
                                  color: design.blue,
                                  fontWeight: FontWeight.w400)),
                          const Spacer(),
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    stock = stock + 1;
                                  });
                                },
                                child: Container(
                                  height: 24.1,
                                  alignment: Alignment.center,
                                  width: 24.1,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      border: Border.all(
                                          width: 1, color: design.shadeP)),
                                  child: Text('+',
                                      style: TextStyle(
                                          fontSize: 10, color: design.blue)),
                                ),
                              ),
                              Container(
                                height: 34,
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                alignment: Alignment.center,
                                width: 34,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: const Color(0xffffffff)),
                                child: Text(stock.toString(),
                                    style: TextStyle(
                                        fontSize: 20, color: design.ash)),
                              ),
                              GestureDetector(
                                onTap: () {
                                  if (stock > 0) {
                                    setState(() {
                                      stock = stock - 1;
                                    });
                                  }
                                },
                                child: Container(
                                  height: 24.1,
                                  alignment: Alignment.center,
                                  width: 24.1,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      border: Border.all(
                                          width: 1, color: design.shadeP)),
                                  child: Text('-',
                                      style: TextStyle(
                                          fontSize: 10, color: design.blue)),
                                ),
                              ),
                              design.wspacer(10),
                            ],
                          ),
                        ],
                      )
                    ]),
              ),
              Container(
                width: width,
                height: 85,
                // padding: const EdgeInsets.all(5),
                margin: const EdgeInsets.fromLTRB(25, 5, 25, 10),
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                decoration: const BoxDecoration(color: Color(0xfff8f8fa)),
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        'assets/shopicon/ac.jpg',
                        height: 44.82,
                        width: 59.5,
                      ),
                      design.wspacer(5),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          design.smallText('IMac 47 Inches'),
                          design.hspacer(5),
                          Builder(builder: (context) {
                            List<Widget> star = List.filled(
                                4,
                                SvgPicture.asset('assets/shopicon/starhalf.svg',
                                    width: 9.98, height: 9.55),
                                growable: true);
                            List<Widget> replace = List.generate(
                                3,
                                (index) => SvgPicture.asset(
                                    'assets/shopicon/star.svg',
                                    width: 9.98,
                                    height: 9.55));
                            star.replaceRange(0, 3, replace);

                            return Row(
                              children: star,
                            );
                          }),
                          const Spacer(),
                          design.amount(
                              design.ash, 12.0, '500,000', FontWeight.w500)
                        ],
                      ),
                      const Spacer(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text('Remove',
                              style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  decorationColor: design.blue,
                                  fontSize: 10,
                                  color: design.blue,
                                  fontWeight: FontWeight.w400)),
                          const Spacer(),
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    stock = stock + 1;
                                  });
                                },
                                child: Container(
                                  height: 24.1,
                                  alignment: Alignment.center,
                                  width: 24.1,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      border: Border.all(
                                          width: 1, color: design.shadeP)),
                                  child: Text('+',
                                      style: TextStyle(
                                          fontSize: 10, color: design.blue)),
                                ),
                              ),
                              Container(
                                height: 34,
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                alignment: Alignment.center,
                                width: 34,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: const Color(0xffffffff)),
                                child: Text(stock.toString(),
                                    style: TextStyle(
                                        fontSize: 20, color: design.ash)),
                              ),
                              GestureDetector(
                                onTap: () {
                                  if (stock > 0) {
                                    setState(() {
                                      stock = stock - 1;
                                    });
                                  }
                                },
                                child: Container(
                                  height: 24.1,
                                  alignment: Alignment.center,
                                  width: 24.1,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      border: Border.all(
                                          width: 1, color: design.shadeP)),
                                  child: Text('-',
                                      style: TextStyle(
                                          fontSize: 10, color: design.blue)),
                                ),
                              ),
                              design.wspacer(10),
                            ],
                          ),
                        ],
                      )
                    ]),
              ),
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Delivery detail',
                        style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                            color: design.blue)),
                    design.hspacer(20),
                    Row(
                      children: [
                        Container(
                            width: (width - 60) / 2,
                            height: 40,
                            padding:
                                const EdgeInsets.symmetric(horizontal: 15.3),
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 1,
                                color: const Color(0xffC0BACE),
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  design.smallText('State'),
                                  Transform.rotate(
                                      angle: 55,
                                      child: Icon(Icons.arrow_back_ios,
                                          size: 10, color: design.darkPurple))
                                ])),
                        design.wspacer(10),
                        Container(
                            width: (width - 60) / 2,
                            height: 40,
                            padding:
                                const EdgeInsets.symmetric(horizontal: 15.3),
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 1,
                                color: const Color(0xffC0BACE),
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  design.smallText('LGA'),
                                  Transform.rotate(
                                      angle: 55,
                                      child: Icon(Icons.arrow_back_ios,
                                          size: 10, color: design.darkPurple))
                                ])),
                      ],
                    ),
                    design.hspacer(10),
                    Container(
                        width: width,
                        height: 60,
                        padding: const EdgeInsets.symmetric(horizontal: 15.3),
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 1,
                            color: const Color(0xffC0BACE),
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const TextField(
                          decoration: InputDecoration(
                              labelText: 'Address',
                              border: InputBorder.none,
                              labelStyle: TextStyle(
                                  color: Color(0xff8e8e8e),
                                  fontSize: 10,
                                  fontWeight: FontWeight.w400)),
                        )),
                  ],
                ),
              ),
              Container(
                decoration: const BoxDecoration(color: Color(0xfff8f8fa)),
                padding: const EdgeInsets.fromLTRB(25, 20, 35, 24),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Total Cost',
                            style: TextStyle(
                                fontSize: 12,
                                color: design.pink,
                                fontWeight: FontWeight.w400)),
                        design.hspacer(10),
                        design.amount(
                            design.ash, 20.0, '500,000', FontWeight.w500)
                      ],
                    ),
                    const Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Status',
                            style: TextStyle(
                                fontSize: 12,
                                color: design.pink,
                                fontWeight: FontWeight.w400)),
                        design.hspacer(10),
                        Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(29),
                              color: const Color(0xffD3AE28).withOpacity(0.2)),
                          padding: const EdgeInsets.fromLTRB(21, 4, 21, 4),
                          child: const Text('Pending Transaction',
                              style: TextStyle(
                                  color: Color(0xffD3AE28),
                                  fontSize: 10,
                                  fontWeight: FontWeight.w500)),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(25, 14, 0, 10),
                child: Text('Payment',
                    style: TextStyle(
                        color: design.numb,
                        fontSize: 10,
                        fontWeight: FontWeight.w400)),
              ),
              Container(
                width: width,
                height: 60,
                margin: const EdgeInsets.fromLTRB(25, 5, 25, 5),
                padding: const EdgeInsets.fromLTRB(26, 16, 16, 11),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SvgPicture.asset(
                      'assets/id.svg',
                    ),
                    design.wspacer(25),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Pay with BNPL Balance',
                          style: TextStyle(
                              color: design.ash,
                              fontSize: 12,
                              fontWeight: FontWeight.w500),
                        ),
                        design.hspacer(10),
                        const Text(
                          '30% of total amount is deducted from your wallet balance',
                          style: TextStyle(
                              color: Color(0xff737373),
                              fontSize: 7,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    const Spacer(),
                    design.amount(design.pink, 10.0, '50,000', FontWeight.w400)
                  ],
                ),
              ),
              Container(
                width: width,
                height: 60,
                margin: const EdgeInsets.fromLTRB(25, 5, 25, 5),
                padding: const EdgeInsets.fromLTRB(26, 16, 16, 11),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SvgPicture.asset(
                      'assets/atm.svg',
                    ),
                    design.wspacer(25),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '2983 9403 93XX XXXX',
                          style: TextStyle(
                              color: design.ash,
                              fontSize: 12,
                              fontWeight: FontWeight.w500),
                        ),
                        design.hspacer(10),
                        Row(
                          children: [
                            const Text(
                              '2983 9403 93XX XXXX',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 7,
                                  fontWeight: FontWeight.w400),
                            ),
                            design.wspacer(5),
                            const Text(
                              'Adekanye West Dotun',
                              style: TextStyle(
                                  color: Color(0xff737373),
                                  fontSize: 7,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const Spacer(),
                    Image.asset('assets/Mastercard.png')
                  ],
                ),
              ),
              Container(
                width: width,
                height: 60,
                margin: const EdgeInsets.fromLTRB(25, 5, 25, 5),
                padding: const EdgeInsets.fromLTRB(26, 16, 16, 11),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SvgPicture.asset(
                      'assets/credit.svg',
                    ),
                    design.wspacer(25),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Pay Using Credit Points',
                          style: TextStyle(
                              color: design.ash,
                              fontSize: 12,
                              fontWeight: FontWeight.w500),
                        ),
                        design.hspacer(10),
                        const Text(
                          '1 credit point equals N1,000',
                          style: TextStyle(
                              color: Color(0xff737373),
                              fontSize: 7,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    const Spacer(),
                    design.input(
                        design.pink, 10.0, '20 Points', FontWeight.w400)
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          context: context,
                          builder: (context) {
                            return Container(
                              width: width,
                              height: 267,
                              padding: const EdgeInsets.all(30),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  design.input(design.blue, 20,
                                      'Set Payment Period', FontWeight.w700),
                                  design.hspacer(10),
                                  const Divider(),
                                  design.hspacer(25),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      InkWell(
                                          child: Container(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      13, 4, 13, 4),
                                              decoration: const BoxDecoration(
                                                  gradient: LinearGradient(
                                                      colors: [
                                                    Color(0xffB5179E),
                                                    Color(0xff3A0CA3)
                                                  ])),
                                              child: design.input(
                                                  Colors.white,
                                                  10,
                                                  '2 Months',
                                                  FontWeight.w400))),
                                      InkWell(
                                          child: Container(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      13, 4, 13, 4),
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      width: 1,
                                                      color: design.blue)),
                                              child: design.input(
                                                  design.blue,
                                                  10,
                                                  '2 Months',
                                                  FontWeight.w400))),
                                      InkWell(
                                          child: Container(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      13, 4, 13, 4),
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      width: 1,
                                                      color: design.blue)),
                                              child: design.input(
                                                  design.blue,
                                                  10,
                                                  '4 Months',
                                                  FontWeight.w400))),
                                      InkWell(
                                          child: Container(
                                        padding: const EdgeInsets.fromLTRB(
                                            13, 4, 13, 4),
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                width: 1, color: design.blue)),
                                        child: design.input(design.blue, 10,
                                            '5 Months', FontWeight.w400),
                                      ))
                                    ],
                                  ),
                                  design.hspacer(10),
                                  design.input(design.pink, 10,
                                      'N 250,000 Per Month', FontWeight.w400),
                                  design.hspacer(20),
                                  GestureDetector(
                                      onTap: () {
                                        Navigator.of(context).pop();
                                        confirmbox(context, width, design);
                                      },
                                      child:
                                          design.longButton(width, 'Confirm'))
                                ],
                              ),
                            );
                          });
                    },
                    child: design.longButton(width, 'Make Payment')),
              )
            ],
          ),
        ),
      ),
    ));
  }

  Future<Object?> confirmbox(BuildContext context, double width, Ui design) {
    return showGeneralDialog(
        context: context,
        pageBuilder: (BuildContext context, Animation animation,
            Animation secondaryAnimation) {
          bool confirm = false;
          return Dialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
              child: Container(
                  height: 398,
                  width: width - 50,
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 30.0),
                        child: Container(
                            padding: const EdgeInsets.all(30),
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                              image: AssetImage('assets/Star 15.png'),
                            )),
                            child: Image.asset('assets/question.png')),
                      ),
                      design.title('Kindly confirm this action'),
                      Padding(
                        padding: const EdgeInsets.only(top: 20, bottom: 10),
                        child: SizedBox(
                          width: 214,
                          child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              style: TextStyle(
                                  color: design.numb,
                                  fontSize: 10,
                                  fontFamily: 'Moderat',
                                  fontWeight: FontWeight.w500),
                              children: <TextSpan>[
                                const TextSpan(
                                  text:
                                      'You are about to make a purchase using the BNPL and would pay',
                                ),
                                // design.naira(design.blue, 10.0),
                                TextSpan(
                                    text: ' N30,000 Upfront',
                                    style: TextStyle(color: design.blue)),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                          width: 265,
                          height: 99,
                          padding: const EdgeInsets.fromLTRB(14, 10, 0, 5),
                          decoration: BoxDecoration(
                              color: const Color(0xffF8F8FA),
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              design.input(design.numb, 10.0,
                                  'Payment Schedule', FontWeight.w400),
                              design.hspacer(5),
                              RichText(
                                // textAlign: TextAlign.center,
                                text: TextSpan(
                                  style: TextStyle(
                                      color: design.ash,
                                      fontSize: 12,
                                      fontFamily: 'Moderat',
                                      fontWeight: FontWeight.w400),
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: 'N 120,000',
                                        style: TextStyle(color: design.pink)),
                                    const TextSpan(
                                      text: ' Per Month for',
                                    ),
                                    TextSpan(
                                        text: ' 6 months',
                                        style: TextStyle(color: design.pink)),
                                    // design.naira(design.blue, 10.0),
                                  ],
                                ),
                              ),
                              // design.hspacer(20),
                              const Spacer(),
                              Row(
                                children: [
                                  Checkbox(
                                      splashRadius: 3,
                                      value: confirm,
                                      onChanged: (bool? val) {
                                        setState(() {
                                          confirm = val!;
                                        });
                                      }),
                                  design.wspacer(5),
                                  design.input(
                                      design.darkPurple,
                                      10.0,
                                      'I agree with this payment scheme',
                                      FontWeight.w400)
                                ],
                              )
                            ],
                          )),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text(
                                'Cancel',
                                style: TextStyle(
                                    color: Color(0xffFF4848),
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500),
                              )),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: GestureDetector(
                                onTap: () {
                                  Navigator.of(context).pop();
                                  handleCheckout(context);
                                  // Navigator.of(context).push(
                                  //     MaterialPageRoute(builder: (context) {
                                  //   return const PurchaseDone();
                                  // }));
                                },
                                child: design.longButton(169.0, 'Confirm')),
                          )
                        ],
                      )
                    ],
                  )));
        });
  }
}
