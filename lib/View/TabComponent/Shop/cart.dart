import 'dart:async';

import 'dart:developer';
import 'dart:io';

import 'package:creadlymobile/Model/Core/cartdata.dart';
import 'package:creadlymobile/Provider/addcartprovider.dart';
import 'package:creadlymobile/Provider/getcartprovider.dart';
import 'package:creadlymobile/Provider/userdataprovider.dart';
import 'package:creadlymobile/View/style.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_paystack_payment/flutter_paystack_payment.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class PaymentPeriod {
  String time;
  int id;
  PaymentPeriod({
    required this.time,
    required this.id,
  });
}

class _CartState extends State<Cart> {
  int stock = 0;

  String paystackPublicKey = 'pk_test_cc4c2259b62bc75842e99e60a2e4ac12a883a840';
  bool inProgress = false;
  String? _cardNumber;
  String? _cvv;
  int? _expiryMonth;
  int? _expiryYear;
  int radioKey = 0;
  PaymentCard _getCardFromUI() {
    // Using just the must-required parameters.
    return PaymentCard(
      number: _cardNumber,
      cvc: _cvv,
      expiryMonth: _expiryMonth,
      expiryYear: _expiryYear,
    );
  }

  List<PaymentPeriod> periodData = [
    PaymentPeriod(time: '2 Months', id: 0),
    PaymentPeriod(time: '3 Months', id: 1),
    PaymentPeriod(time: '4 Months', id: 2),
    PaymentPeriod(time: '5 Months', id: 3)
  ];
  int paymentKey = 0;
  List<int> radiokeyList = List.generate(3, (index) => index + 1);
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

  handleCheckout(BuildContext context, int amount) async {
    // if (_method != CheckoutMethod.card && _isLocal) {
    //   _showMessage('Select server initialization method at the top');
    //   return;
    // }
    // setState(() => inProgress = true);
    // _formKey.currentState?.save();
    Charge charge = Charge()
      ..amount = amount // In base currency
      ..email = Provider.of<UserDataProvider>(context, listen: false).email
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

  List<Color> gradientPickPayment = [
    const Color(0xffB5179E),
    const Color(0xff3A0CA3)
  ];
  List<Color> plainPickPayment = [
    const Color(0xffffffff),
    const Color(0xffffffff)
  ];
  String stateChoose = 'State';
  final plugin = PaystackPayment();
  bool update = false;
  Future<List<CartData>>? futureCart;
  Future<int>? totalAmount;
  List<int>? productlimit;
  final List<DropdownMenuItem<String>> lgaData = [
    const DropdownMenuItem<String>(
        value: 'lagosAgege', child: Text('lagosAgege')),
    const DropdownMenuItem<String>(
        value: 'lagosAjeromiIfelodun',
        child: Text(
          'lagosAjeromiIfelodun',
        )),
    const DropdownMenuItem<String>(
        value: 'lagosAmuwoOdofin', child: Text('lagosAmuwoOdofin')),
    const DropdownMenuItem<String>(
        value: 'lagosBadagry', child: Text('lagosBadagry')),
    const DropdownMenuItem<String>(
        value: 'lagosApapa', child: Text('lagosApapa')),
    const DropdownMenuItem<String>(value: 'lagosEpe', child: Text('lagosEpe')),
    const DropdownMenuItem<String>(
        value: 'lagosEtiOsa', child: Text('lagosEtiOsa')),
    const DropdownMenuItem<String>(
        value: 'lagosIbejuLekki', child: Text('lagosIbejuLekki')),
    const DropdownMenuItem<String>(
        value: 'lagosIkeja', child: Text('lagosIkeja')),
    const DropdownMenuItem<String>(
        value: 'lagosIkorodu', child: Text('lagosIkorodu')),
    const DropdownMenuItem<String>(
        value: 'lagosKosofe', child: Text('lagosKosofe')),
    const DropdownMenuItem<String>(
        value: 'lagosLagosIsland', child: Text('lagosLagosIsland')),
    const DropdownMenuItem<String>(
        value: 'lagosMushin', child: Text('lagosMushin')),
    const DropdownMenuItem<String>(value: 'lagosOjo', child: Text('lagosOjo')),
    const DropdownMenuItem<String>(
        value: 'lagosOshodiIsolo', child: Text('lagosOshodiIsolo')),
    const DropdownMenuItem<String>(
        value: 'lagosShomolu', child: Text('lagosShomolu')),
    const DropdownMenuItem<String>(
        value: 'lagosSurulereLagosState',
        child: Text('lagosSurulereLagosState')),
    const DropdownMenuItem<String>(
        value: 'northCentral', child: Text('northCentral')),
    const DropdownMenuItem<String>(
        value: 'northEast', child: Text('northEast')),
    const DropdownMenuItem<String>(
        value: 'northWest', child: Text('northWest')),
    const DropdownMenuItem<String>(
        value: 'southEast', child: Text('southEast')),
    const DropdownMenuItem<String>(
        value: 'southSouth', child: Text('southSouth')),
    const DropdownMenuItem<String>(
        value: 'southWest', child: Text('southWest')),
  ];
  @override
  void initState() {
    super.initState();
    update = true;
    plugin.initialize(publicKey: paystackPublicKey);
    totalAmount =
        Provider.of<GetCartProvider>(context, listen: false).totalAmount();
    futureCart = Provider.of<GetCartProvider>(context, listen: false).getData();
    Provider.of<GetCartProvider>(context, listen: false).getData().then((r) {
      for (var i = 0; i < r.length; i++) {
        List<int> sum = List.filled(r.length, 0);
        setState(() {
          productlimit = sum;
        });
      }
    });
    // Provider.of<GetCartProvider>(context, listen: false).updateTotalCost();
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
              Consumer<GetCartProvider>(builder: (context, data, child) {
                return FutureBuilder<List<CartData>>(
                    future: futureCart,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState.name == 'done') {
                        // setState(() {

                        // });
                        return Column(
                            children: List.generate(
                          snapshot.data!.length,
                          (index) => Container(
                            width: width,
                            height: 85,
                            // padding: const EdgeInsets.all(5),
                            margin: const EdgeInsets.fromLTRB(25, 24, 25, 5),
                            padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                            decoration:
                                const BoxDecoration(color: Color(0xfff8f8fa)),
                            child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.network(
                                    snapshot.data![index].image!,
                                    height: 44.82,
                                    width: 59.5,
                                  ),
                                  design.wspacer(5),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      design.smallText(
                                          snapshot.data![index].name!),
                                      design.hspacer(5),
                                      Builder(builder: (context) {
                                        List<Widget> star = List.filled(
                                            4,
                                            SvgPicture.asset(
                                                'assets/shopicon/starhalf.svg',
                                                width: 9.98,
                                                height: 9.55),
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
                                          design.ash,
                                          12.0,
                                          snapshot.data![index].price!
                                              .toString(),
                                          FontWeight.w500)
                                    ],
                                  ),
                                  const Spacer(),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          Provider.of<AddCartProvider>(context,
                                                  listen: false)
                                              .removeCart(
                                                  snapshot.data![index].id!)
                                              .then((value) {
                                            setState(() {
                                              snapshot.data!.removeAt(index);
                                            });
                                          });
                                        },
                                        child: Text('Remove',
                                            style: TextStyle(
                                                decoration:
                                                    TextDecoration.underline,
                                                decorationColor: design.blue,
                                                fontSize: 10,
                                                color: design.blue,
                                                fontWeight: FontWeight.w400)),
                                      ),
                                      const Spacer(),
                                      Row(
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                productlimit![index] =
                                                    productlimit![index] + 1;
                                              });
                                            },
                                            child: Container(
                                              height: 24.1,
                                              alignment: Alignment.center,
                                              width: 24.1,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                  border: Border.all(
                                                      width: 1,
                                                      color: design.shadeP)),
                                              child: Text('+',
                                                  style: TextStyle(
                                                      fontSize: 10,
                                                      color: design.blue)),
                                            ),
                                          ),
                                          Container(
                                            height: 34,
                                            margin: const EdgeInsets.symmetric(
                                                horizontal: 10),
                                            alignment: Alignment.center,
                                            width: 34,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                color: const Color(0xffffffff)),
                                            child: Text(
                                                productlimit![index].toString(),
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    color: design.ash)),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              if (productlimit![index] != 0) {
                                                setState(() {
                                                  productlimit![index] =
                                                      productlimit![index] - 1;
                                                });
                                              }
                                            },
                                            child: Container(
                                              height: 24.1,
                                              alignment: Alignment.center,
                                              width: 24.1,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                  border: Border.all(
                                                      width: 1,
                                                      color: design.shadeP)),
                                              child: Text('-',
                                                  style: TextStyle(
                                                      fontSize: 10,
                                                      color: design.blue)),
                                            ),
                                          ),
                                          design.wspacer(10),
                                        ],
                                      ),
                                    ],
                                  )
                                ]),
                          ),
                        ));
                      }
                      if (snapshot.connectionState.name == 'waiting') {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(25, 25, 25, 10),
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
                                            borderRadius:
                                                BorderRadius.circular(10),
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
                                      highlightColor: const Color(0xFFEBEBF4)
                                          .withOpacity(0.1),
                                      // loop: 5,
                                      enabled: true,
                                      // period: const Duration(milliseconds: 1500),
                                      child: Container(
                                        height: 18,
                                        width: 100,
                                        decoration: BoxDecoration(
                                          color: const Color(0xffFfFfFf),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                      )),
                                ],
                              ),
                            ),
                            Shimmer.fromColors(
                                baseColor: const Color(0xFFEBEBF4),
                                highlightColor:
                                    const Color(0xFFEBEBF4).withOpacity(0.1),
                                // loop: 5,
                                enabled: true,
                                // period: const Duration(milliseconds: 1500),
                                child: Container(
                                  height: 70,
                                  decoration: const BoxDecoration(
                                    color: Color(0xffFfFfFf),
                                    // borderRadius: BorderRadius.circular(10),
                                  ),
                                )),
                            Container(
                                padding:
                                    const EdgeInsets.fromLTRB(25, 15, 25, 10),
                                decoration: const BoxDecoration(
                                    color: Color(0xfff8f8fa)),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Shimmer.fromColors(
                                        baseColor: const Color(0xFFEBEBF4),
                                        highlightColor: const Color(0xFFEBEBF4)
                                            .withOpacity(0.1),
                                        // loop: 5,
                                        enabled: true,
                                        // period: const Duration(milliseconds: 1500),
                                        child: Container(
                                          height: 18,
                                          width: 100,
                                          decoration: BoxDecoration(
                                            color: const Color(0xffFfFfFf),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                        )),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          bottom: 25, top: 10),
                                      child: Row(
                                        children: [
                                          Shimmer.fromColors(
                                              baseColor:
                                                  const Color(0xFFEBEBF4),
                                              highlightColor:
                                                  const Color(0xFFEBEBF4)
                                                      .withOpacity(0.1),
                                              // loop: 5,
                                              enabled: true,
                                              // period: const Duration(milliseconds: 1500),
                                              child: Container(
                                                height: 18,
                                                width: 100,
                                                decoration: BoxDecoration(
                                                  color:
                                                      const Color(0xffFfFfFf),
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                              )),
                                          const Spacer(),
                                          Shimmer.fromColors(
                                              baseColor:
                                                  const Color(0xFFEBEBF4),
                                              highlightColor:
                                                  const Color(0xFFEBEBF4)
                                                      .withOpacity(0.1),
                                              // loop: 5,
                                              enabled: true,
                                              // period: const Duration(milliseconds: 1500),
                                              child: Container(
                                                height: 20,
                                                width: 20,
                                                decoration: const BoxDecoration(
                                                  color: Color(0xffFfFfFf),
                                                ),
                                              )),
                                        ],
                                      ),
                                    ),
                                  ],
                                ))
                          ],
                        );
                      } else {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(25, 25, 25, 10),
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
                                            borderRadius:
                                                BorderRadius.circular(10),
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
                                      highlightColor: const Color(0xFFEBEBF4)
                                          .withOpacity(0.1),
                                      // loop: 5,
                                      enabled: true,
                                      // period: const Duration(milliseconds: 1500),
                                      child: Container(
                                        height: 18,
                                        width: 100,
                                        decoration: BoxDecoration(
                                          color: const Color(0xffFfFfFf),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                      )),
                                ],
                              ),
                            ),
                            Shimmer.fromColors(
                                baseColor: const Color(0xFFEBEBF4),
                                highlightColor:
                                    const Color(0xFFEBEBF4).withOpacity(0.1),
                                // loop: 5,
                                enabled: true,
                                // period: const Duration(milliseconds: 1500),
                                child: Container(
                                  height: 70,
                                  decoration: const BoxDecoration(
                                    color: Color(0xffFfFfFf),
                                    // borderRadius: BorderRadius.circular(10),
                                  ),
                                )),
                            Container(
                                padding:
                                    const EdgeInsets.fromLTRB(25, 15, 25, 10),
                                decoration: const BoxDecoration(
                                    color: Color(0xfff8f8fa)),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Shimmer.fromColors(
                                        baseColor: const Color(0xFFEBEBF4),
                                        highlightColor: const Color(0xFFEBEBF4)
                                            .withOpacity(0.1),
                                        // loop: 5,
                                        enabled: true,
                                        // period: const Duration(milliseconds: 1500),
                                        child: Container(
                                          height: 18,
                                          width: 100,
                                          decoration: BoxDecoration(
                                            color: const Color(0xffFfFfFf),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                        )),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          bottom: 25, top: 10),
                                      child: Row(
                                        children: [
                                          Shimmer.fromColors(
                                              baseColor:
                                                  const Color(0xFFEBEBF4),
                                              highlightColor:
                                                  const Color(0xFFEBEBF4)
                                                      .withOpacity(0.1),
                                              // loop: 5,
                                              enabled: true,
                                              // period: const Duration(milliseconds: 1500),
                                              child: Container(
                                                height: 18,
                                                width: 100,
                                                decoration: BoxDecoration(
                                                  color:
                                                      const Color(0xffFfFfFf),
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                              )),
                                          const Spacer(),
                                          Shimmer.fromColors(
                                              baseColor:
                                                  const Color(0xFFEBEBF4),
                                              highlightColor:
                                                  const Color(0xFFEBEBF4)
                                                      .withOpacity(0.1),
                                              // loop: 5,
                                              enabled: true,
                                              // period: const Duration(milliseconds: 1500),
                                              child: Container(
                                                height: 20,
                                                width: 20,
                                                decoration: const BoxDecoration(
                                                  color: Color(0xffFfFfFf),
                                                ),
                                              )),
                                        ],
                                      ),
                                    ),
                                  ],
                                ))
                          ],
                        );
                      }
                    });
              }),
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
                                  design.smallText(stateChoose),
                                  Expanded(
                                    flex: 1,
                                    child: DropdownButton<String>(
                                      isExpanded: true,
                                      underline: const SizedBox(),
                                      icon: Transform.rotate(
                                          angle: 55,
                                          child: Icon(Icons.arrow_back_ios,
                                              size: 10,
                                              color: design.darkPurple)),
                                      onChanged: (String? value) {
                                        setState(() {
                                          stateChoose = value!;
                                        });
                                      },
                                      items: const [
                                        DropdownMenuItem<String>(
                                            value: 'Lagos',
                                            child: Text('Lagos')),
                                      ],
                                    ),
                                  )
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
                                  Expanded(
                                    flex: 1,
                                    child: DropdownButton<String>(
                                        isExpanded: true,
                                        underline: const SizedBox(),
                                        icon: Transform.rotate(
                                            angle: 55,
                                            child: Icon(Icons.arrow_back_ios,
                                                size: 10,
                                                color: design.darkPurple)),
                                        onChanged: (String? value) {
                                          setState(() {
                                            stateChoose = value!;
                                          });
                                        },
                                        items: lgaData),
                                  )
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
              Consumer<GetCartProvider>(builder: (context, data, child) {
                return Container(
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
                          FutureBuilder<int>(
                              future: totalAmount,
                              builder: (context, snapshot) {
                                if (snapshot.connectionState.name == 'done') {
                                  return design.amount(
                                      design.ash,
                                      20.0,
                                      snapshot.data.toString(),
                                      FontWeight.w500);
                                }
                                return SizedBox(
                                    height: 50,
                                    width: 50,
                                    child: design.loadingProgress());
                              }),
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
                                color:
                                    const Color(0xffD3AE28).withOpacity(0.2)),
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
                );
              }),
              Padding(
                padding: const EdgeInsets.fromLTRB(25, 14, 0, 10),
                child: Text('Payment',
                    style: TextStyle(
                        color: design.numb,
                        fontSize: 10,
                        fontWeight: FontWeight.w400)),
              ),
              // Container(
              //   width: width,
              //   height: 60,
              //   margin: const EdgeInsets.fromLTRB(25, 5, 25, 5),
              //   padding: const EdgeInsets.fromLTRB(26, 16, 16, 11),
              //   child: Row(
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: [
              //       SvgPicture.asset(
              //         'assets/id.svg',
              //       ),
              //       design.wspacer(25),
              //       Column(
              //         crossAxisAlignment: CrossAxisAlignment.start,
              //         children: [
              //           Text(
              //             'Pay with BNPL Balance',
              //             style: TextStyle(
              //                 color: design.ash,
              //                 fontSize: 12,
              //                 fontWeight: FontWeight.w500),
              //           ),
              //           design.hspacer(10),
              //           const Text(
              //             '30% of total amount is deducted from your wallet balance',
              //             style: TextStyle(
              //                 color: Color(0xff737373),
              //                 fontSize: 7,
              //                 fontWeight: FontWeight.w400),
              //           ),
              //         ],
              //       ),
              //       const Spacer(),
              //       design.amount(design.pink, 10.0, '50,000', FontWeight.w400),
              //       Radio(
              //         activeColor: const Color(0xff121212),
              //         value: radiokeyList[0],
              //         groupValue: radioKey,
              //         onChanged: (int? value) {
              //           setState(() {
              //             radioKey = value!;
              //           });
              //         },
              //       ),
              //     ],
              //   ),
              // ),
              // Container(
              //   width: width,
              //   height: 60,
              //   margin: const EdgeInsets.fromLTRB(25, 5, 25, 5),
              //   padding: const EdgeInsets.fromLTRB(26, 16, 16, 11),
              //   child: Row(
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: [
              //       SvgPicture.asset(
              //         'assets/atm.svg',
              //       ),
              //       design.wspacer(25),
              //       Column(
              //         crossAxisAlignment: CrossAxisAlignment.start,
              //         children: [
              //           Text(
              //             '2983 9403 93XX XXXX',
              //             style: TextStyle(
              //                 color: design.ash,
              //                 fontSize: 12,
              //                 fontWeight: FontWeight.w500),
              //           ),
              //           design.hspacer(10),
              //           Row(
              //             children: [
              //               const Text(
              //                 '2983 9403 93XX XXXX',
              //                 style: TextStyle(
              //                     color: Colors.black,
              //                     fontSize: 7,
              //                     fontWeight: FontWeight.w400),
              //               ),
              //               design.wspacer(5),
              //               const Text(
              //                 'Adekanye West Dotun',
              //                 style: TextStyle(
              //                     color: Color(0xff737373),
              //                     fontSize: 7,
              //                     fontWeight: FontWeight.w400),
              //               ),
              //             ],
              //           ),
              //         ],
              //       ),
              //       const Spacer(),
              //       Image.asset('assets/Mastercard.png'),
              //       Radio(
              //         activeColor: const Color(0xff121212),
              //         value: radiokeyList[1],
              //         groupValue: radioKey,
              //         onChanged: (int? value) {
              //           setState(() {
              //             radioKey = value!;
              //           });
              //         },
              //       ),
              //     ],
              //   ),
              // ),
              // Container(
              //   width: width,
              //   height: 60,
              //   margin: const EdgeInsets.fromLTRB(25, 5, 25, 5),
              //   padding: const EdgeInsets.fromLTRB(26, 16, 16, 11),
              //   child: Row(
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: [
              //       SvgPicture.asset(
              //         'assets/credit.svg',
              //       ),
              //       design.wspacer(25),
              //       Column(
              //         crossAxisAlignment: CrossAxisAlignment.start,
              //         children: [
              //           Text(
              //             'Pay Using Credit Points',
              //             style: TextStyle(
              //                 color: design.ash,
              //                 fontSize: 12,
              //                 fontWeight: FontWeight.w500),
              //           ),
              //           design.hspacer(10),
              //           const Text(
              //             '1 credit point equals N1,000',
              //             style: TextStyle(
              //                 color: Color(0xff737373),
              //                 fontSize: 7,
              //                 fontWeight: FontWeight.w400),
              //           ),
              //         ],
              //       ),
              //       const Spacer(),
              //       design.input(
              //           design.pink, 10.0, '20 Points', FontWeight.w400),
              //       Radio(
              //         activeColor: const Color(0xff121212),
              //         value: radiokeyList[2],
              //         groupValue: radioKey,
              //         onChanged: (int? value) {
              //           setState(() {
              //             radioKey = value!;
              //           });
              //         },
              //       ),
              //     ],
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          context: context,
                          builder: (context) {
                            return StatefulBuilder(
                                builder: (context, StateSetter setState) {
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
                                      children: List.generate(
                                        periodData.length,
                                        (index) => InkWell(
                                            onTap: () {
                                              setState(() {
                                                paymentKey =
                                                    periodData[index].id;
                                              });
                                            },
                                            child: Container(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        13, 4, 13, 4),
                                                decoration: BoxDecoration(
                                                    gradient: LinearGradient(
                                                        colors: paymentKey ==
                                                                periodData[index]
                                                                    .id
                                                            ? gradientPickPayment
                                                            : plainPickPayment),
                                                    border: Border.all(
                                                        width: 1,
                                                        color: design.blue)),
                                                child: design.input(
                                                    paymentKey == periodData[index].id
                                                        ? Colors.white
                                                        : design.blue,
                                                    10,
                                                    periodData[index].time,
                                                    FontWeight.w400))),
                                      ),
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
          return StatefulBuilder(builder: (context, StateSetter setState) {
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
                                  int amount = 50000;
                                  Navigator.of(context).pop();
                                  handleCheckout(context, amount);
                                  // Navigator.of(context).push(
                                  //     MaterialPageRoute(builder: (context) {
                                  //   return const PurchaseDone();
                                  // }));
                                },
                                child: design.longButton(169.0, 'Confirm'))
                          ],
                        )
                      ],
                    )));
          });
        });
  }
}
