import 'package:creadlymobile/View/TabComponent/Shop/purchasedone.dart';
import 'package:creadlymobile/View/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OrderProcess extends StatefulWidget {
  const OrderProcess({Key? key}) : super(key: key);

  @override
  State<OrderProcess> createState() => _OrderProcessState();
}

class _OrderProcessState extends State<OrderProcess> {
  int stock = 0;
  int ind = 0;
  bool confirm = false;
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
                height: 60,
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
                        ],
                      ),
                      const Spacer(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          design.amount(
                              design.ash, 12.0, '500,000', FontWeight.w500),
                          Text('2 Units',
                              style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w400,
                                  color: design.blue))
                        ],
                      )
                    ]),
              ),
              Container(
                width: width,
                height: 60,
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
                        ],
                      ),
                      const Spacer(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          design.amount(
                              design.ash, 12.0, '500,000', FontWeight.w500),
                          Text('2 Units',
                              style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w400,
                                  color: design.blue))
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
                child: Text('Progress',
                    style: TextStyle(
                        color: design.numb,
                        fontSize: 10,
                        fontWeight: FontWeight.w400)),
              ),
              Padding(
                  padding: const EdgeInsets.fromLTRB(25, 14, 0, 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Icon(Icons.circle_outlined,
                                  size: 13, color: Color(0xffEDAD4E)),
                              Container(
                                width: 1,
                                height: 74,
                                decoration: const BoxDecoration(
                                    color: Color(0xffEDAD4E)),
                              ),
                            ],
                          ),
                          design.wspacer(15),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              design.input(
                                  design.ash,
                                  12,
                                  'Vendor has confirmed order',
                                  FontWeight.w500),
                              design.smallText(
                                  'The Order is enroute and to be delivered to user at stipulated address')
                            ],
                          ),
                        ],
                      ),
                      Opacity(
                        opacity: 0.3,
                        child: Row(
                          children: [
                            const Icon(Icons.circle_outlined,
                                size: 13, color: Color(0xffECECEC)),
                            design.wspacer(15),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                design.input(design.ash, 12,
                                    'User Confirm Delivery', FontWeight.w500),
                                design.smallText(
                                    'User has confirmed that the order has been delivered')
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  )),
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: GestureDetector(
                    onTap: () {
                      bottomalert(context, width, design);
                    },
                    child: design.longButton(width, 'Make Payment')),
              )
            ],
          ),
        ),
      ),
    ));
  }

  Future<dynamic> bottomalert(BuildContext context, double width, Ui design) {
    return showModalBottomSheet(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        context: context,
        builder: (context) {
          return Container(
            width: width,
            height: 251,
            padding: const EdgeInsets.fromLTRB(30, 30, 30, 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                design.input(
                    design.blue, 20, 'Rate the Product', FontWeight.w700),
                design.hspacer(10),
                const Divider(),
                design.hspacer(25),
                Builder(builder: (context) {
                  List<Widget> star = List.generate(
                      5,
                      (index) => GestureDetector(
                            onTap: () {
                              setState(() {
                                ind = index;
                              });
                              // print(ind);
                            },
                            child: SvgPicture.asset(
                                'assets/shopicon/star_outline.svg',
                                width: 29.07,
                                height: 27.78),
                          ),
                      growable: true);
                  List<Widget> replace = List.generate(
                      ind,
                      (index) => SvgPicture.asset('assets/shopicon/star.svg',
                          width: 29.07, height: 27.78));
                  star.replaceRange(0, ind, replace);

                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: star,
                  );
                }),
                const Spacer(),
                GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                      bottomalert2(context, width, design);
                    },
                    child: design.longButton(width, 'Send'))
              ],
            ),
          );
        });
  }

  Future<dynamic> bottomalert2(BuildContext context, double width, Ui design) {
    return showModalBottomSheet(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        context: context,
        builder: (context) {
          return Container(
            width: width,
            padding: const EdgeInsets.fromLTRB(30, 30, 30, 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: design.input(
                      design.blue, 20, 'Rate the Credley App', FontWeight.w700),
                ),
                design.hspacer(10),
                const Divider(),
                design.hspacer(25),
                Center(
                  child: Builder(builder: (context) {
                    List<Widget> star = List.generate(5, (index) {
                      //  star.insert(index, element)

                      return GestureDetector(
                        onTap: () {},
                        child: SvgPicture.asset(
                            'assets/shopicon/star_outline.svg',
                            width: 29.07,
                            height: 27.78),
                      );
                    });

                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: star,
                    );
                  }),
                ),
                design.hspacer(10),
                const Text('Comment',
                    style: TextStyle(
                        color: Color(0xff8e8e8e),
                        fontSize: 10,
                        fontWeight: FontWeight.w400)),
                design.hspacer(10),
                Container(
                    width: width,
                    height: 83,
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
                          labelText: 'Comment',
                          border: InputBorder.none,
                          labelStyle: TextStyle(
                              color: Color(0xff8e8e8e),
                              fontSize: 10,
                              fontWeight: FontWeight.w400)),
                    )),
                design.hspacer(20),
                GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                      confirmbox(context, width, design);
                    },
                    child: Center(child: design.longButton(169, 'Confirm')))
              ],
            ),
          );
        });
  }

  Future<Object?> confirmbox(BuildContext context, double width, Ui design) {
    return showGeneralDialog(
        context: context,
        pageBuilder: (BuildContext context, Animation animation,
            Animation secondaryAnimation) {
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
                                      'You are about to confirm that the delivery of  has been made to your',
                                ),
                                // design.naira(design.blue, 10.0),
                                TextSpan(
                                    text: 'IMAX 453 ',
                                    style: TextStyle(color: design.blue)),
                                const TextSpan(
                                  text: 'has been made to you',
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
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
                                  Navigator.of(context).push(
                                      MaterialPageRoute(builder: (context) {
                                    return const PurchaseDone();
                                  }));
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
