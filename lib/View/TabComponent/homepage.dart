import 'package:creadlymobile/View/Auth/verification.dart';
import 'package:creadlymobile/View/TabComponent/BNPL/bnpl.dart';
import 'package:creadlymobile/View/TabComponent/Salary-Advanced/salary.dart';
import 'package:creadlymobile/View/TabComponent/Shop/productdetail.dart';
import 'package:creadlymobile/View/TabComponent/Shop/searchproduct.dart';
import 'package:creadlymobile/View/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../Provider/productprovider.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class CreditModel {
  String title;
  String amount;
  int id;
  String mode;
  Color color;

  CreditModel({
    required this.title,
    required this.id,
    required this.mode,
    required this.amount,
    required this.color,
  });
}

class _HomepageState extends State<Homepage> {
  @override
  void initState() {
    super.initState();
    Provider.of<ProductProvider>(context, listen: false).getProductData();
  }

  List<Product> products = [
    Product(
        title: 'Hisense Refrigerator...',
        amount: '500,000',
        imageurl: 'fridge'),
    Product(title: 'Nike Sneakers AF683', amount: '70,000', imageurl: 'shoe'),
    Product(
        title: 'Black Stylish Beanie', amount: '500,000', imageurl: 'beanie'),
    Product(title: 'LG Microwave', amount: '70,000', imageurl: 'machine'),
    Product(title: 'Samsung Split Air C...', amount: '70,000', imageurl: 'ac'),
    Product(title: 'I Mac 47 Inches', amount: '500,000', imageurl: 'imac'),
  ];
  List<CreditModel> creditmodel = [
    CreditModel(
        title: 'BNPL Balance',
        amount: '200,000',
        mode: 'Make Request',
        id: 0,
        color: const Color(0xff3A0CA3)),
    CreditModel(
        title: 'Salary Advance',
        mode: 'Withdraw',
        id: 1,
        amount: '300,000',
        color: const Color(0xffCB32B5)),
  ];
  int creditmodelno = 0;
  bool newuser = true;

  @override
  Widget build(BuildContext context) {
    final design = Ui();
    final width = MediaQuery.of(context).size.width;

    return design.layout(SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: width,
            height: 114,
            decoration: const BoxDecoration(color: Color(0xffEDE9F7)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        margin: const EdgeInsets.symmetric(vertical: 5),
                        padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: const Color(0xffD11919).withOpacity(0.2)),
                        child: const Text(
                          'Awaiting HR Approval',
                          style: TextStyle(
                              fontSize: 6.0,
                              fontWeight: FontWeight.w500,
                              color: Color(0xffD11919)),
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            'Hello Adekanye,',
                            style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.w700,
                                color: design.productblack),
                          ),
                          Image.asset('assets/emoji.png')
                        ],
                      ),
                      design.hspacer(3),
                      const Text(
                        'What can we do for you today ?',
                        style: TextStyle(
                            fontSize: 10.0,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff737373)),
                      ),
                    ],
                  ),
                  Container(
                    width: 45,
                    height: 45,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(1),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(22),
                        gradient: const LinearGradient(
                            colors: [Color(0xffB5179E), Color(0xff3A0CA3)])),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(22),
                        child: Image.asset(
                          'assets/man.png',
                          fit: BoxFit.fill,
                          width: 44,
                          height: 44,
                        )),
                  )
                ],
              ),
            ),
          ),
          Center(
            child: Padding(
                padding: const EdgeInsets.fromLTRB(30, 30, 30, 10),
                child: SizedBox(
                  height: 136,
                  child: PageView.builder(
                      itemCount: creditmodel.length,
                      onPageChanged: (value) {
                        setState(() {
                          creditmodelno = value;
                        });
                      },
                      itemBuilder: (BuildContext context, index) {
                        return InkWell(
                          onTap: () {
                            if (index == 0) {
                              Navigator.of(context)
                                  .push(MaterialPageRoute(builder: (context) {
                                return const Bnpl();
                              }));
                            } else {
                              Navigator.of(context)
                                  .push(MaterialPageRoute(builder: (context) {
                                return const SalaryAdvanced();
                              }));
                            }
                          },
                          child: Container(
                            width: width,
                            height: 136,
                            margin: const EdgeInsets.all(2),
                            decoration: BoxDecoration(
                              color: creditmodel[index].color,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Stack(
                              children: [
                                Align(
                                    alignment: Alignment.topLeft,
                                    child: SvgPicture.asset(
                                      'assets/group2.svg',
                                      color: const Color(0xffffffff)
                                          .withOpacity(0.5),
                                    )),
                                Center(
                                    child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      creditmodel[index].title,
                                      style: TextStyle(
                                          fontSize: 10.0,
                                          fontWeight: FontWeight.w400,
                                          color: design.shadeP),
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        design.naira(Colors.white, 32.0),
                                        Text(
                                          newuser
                                              ? '--'
                                              : creditmodel[index].amount,
                                          style: const TextStyle(
                                              fontSize: 32.0,
                                              fontWeight: FontWeight.w700,
                                              color: Colors.white),
                                        ),
                                      ],
                                    ),
                                    Visibility(
                                      visible: !newuser,
                                      child: Container(
                                        width: 100,
                                        height: 20,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            color: const Color(0xffffffff)
                                                .withOpacity(0.5)),
                                        child: Text(
                                          creditmodel[index].mode,
                                          style: const TextStyle(
                                              fontSize: 10.0,
                                              fontWeight: FontWeight.w500,
                                              color: Color(0xffffffff)),
                                        ),
                                      ),
                                    ),
                                  ],
                                )),
                                Align(
                                    alignment: Alignment.bottomRight,
                                    child: SvgPicture.asset(
                                      'assets/group.svg',
                                      color: const Color(0xffffffff)
                                          .withOpacity(0.5),
                                    )),
                              ],
                            ),
                          ),
                        );
                      }),
                )),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
                creditmodel.length,
                (index) => Container(
                    height: 8,
                    width: creditmodel[index].id == creditmodelno ? 30 : 10,
                    margin: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: creditmodel[index].id == creditmodelno
                            ? creditmodel[index].color
                            : const Color(0xffD9D9D9)))),
          ),
          Visibility(
            visible: newuser,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: GestureDetector(
                  onTap: () {
                    design.nav(context, const Verificationpage());
                    setState(() {
                      newuser = false;
                    });
                  },
                  child: Container(
                    width: width,
                    height: 80,
                    padding: const EdgeInsets.only(left: 20),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: const Color(0xffFF4848),
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      children: [
                        SizedBox(
                            height: 40,
                            width: 40,
                            child: Stack(
                              children: [
                                Container(
                                  width: 39,
                                  height: 39,
                                  alignment: Alignment.center,
                                  margin: const EdgeInsets.all(2),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(20)),
                                  child: design.smallineartext('50%', 10),
                                ),
                                Positioned(
                                    // bottom: 5,
                                    // right: 0,
                                    child: Align(
                                  alignment: Alignment.centerRight,
                                  child: Image.asset(
                                    'assets/acr.png',
                                  ),
                                ))
                              ],
                            )),
                        design.wspacer(15),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            design.input(Colors.white, 15,
                                'Complete your registration', FontWeight.w500),
                            design.hspacer(5),
                            design.input(
                                const Color(0xffFF9C9C),
                                10,
                                'BVN, D.O.B and full name needed',
                                FontWeight.w500)
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(25, 10, 25, 10),
            child: Row(
              children: [
                SvgPicture.asset('assets/fire.svg'),
                design.wspacer(5),
                design.input(design.blue, 15, "Hot deals", FontWeight.w700),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(25, 10, 25, 10),
                child: SizedBox(
                    height: 160,
                    child: ListView.builder(
                        itemCount: products.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              // Navigator.of(context)
                              //     .push(MaterialPageRoute(builder: (context) {
                              //   return const Productdetail(id: 0);
                              // }));
                            },
                            child: Container(
                              height: 150,
                              width: 150,
                              margin: const EdgeInsets.all(5),
                              alignment: Alignment.topCenter,
                              decoration: BoxDecoration(
                                color: const Color(0xffFfFfFf),
                                border: Border.all(
                                    width: 1, color: const Color(0xfff8f8f8)),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                      height: 100,
                                      width: (width - 50 - 15) / 2,
                                      padding: const EdgeInsets.all(12),
                                      decoration: const BoxDecoration(
                                        color: Color(0xffF6F6F6),
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(10),
                                            bottomLeft: Radius.circular(10),
                                            bottomRight: Radius.circular(10),
                                            topRight: Radius.circular(10)),
                                      ),
                                      child: Image.asset(
                                        'assets/shopicon/${products[index].imageurl}.jpg',
                                      )),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(12, 6, 0, 2),
                                    child:
                                        design.smallText(products[index].title),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 12),
                                    child: Row(children: [
                                      design.amount(
                                          design.ash,
                                          12.0,
                                          products[index].amount,
                                          FontWeight.w500),
                                      const Spacer(),
                                      const Icon(Icons.favorite_outline,
                                          size: 12, color: Color(0xff0d0d0d))
                                    ]),
                                  )
                                ],
                              ),
                            ),
                          );
                        })),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(25, 10, 25, 10),
            child: design.input(design.ash, 15, "Products", FontWeight.w700),
          ),
          Consumer<ProductProvider>(builder: (context, data, child) {
            return Padding(
              padding: const EdgeInsets.fromLTRB(25, 10, 25, 50),
              child: GridView.count(
                // crossAxisCount: 2,
                shrinkWrap: true,
                crossAxisCount: 2,
                childAspectRatio: 1.1,
                crossAxisSpacing: 15.0,
                mainAxisSpacing: 10.0,
                physics: const ScrollPhysics(),
                children: List.generate(
                    data.productData.length,
                    (index) => GestureDetector(
                          onTap: () {
                            final id = data.productData[index].id!;
                            final merchantId =
                                data.productData[index].merchant!;
                            Provider.of<ProductProvider>(context, listen: false)
                                .performQuery(id.trim(), context, merchantId)
                                .then((val) => Navigator.of(context).push(
                                        MaterialPageRoute(builder: (context) {
                                      return const Productdetail();
                                    })));
                          },
                          child: Container(
                            alignment: Alignment.topCenter,
                            decoration: BoxDecoration(
                              color: const Color(0xffFfFfFf),
                              border: Border.all(
                                  width: 1, color: const Color(0xfff8f8f8)),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                    height: 100,
                                    width: (width - 50 - 15) / 2,
                                    padding: const EdgeInsets.all(12),
                                    decoration: const BoxDecoration(
                                      color: Color(0xffF6F6F6),
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(10),
                                          bottomLeft: Radius.circular(10),
                                          bottomRight: Radius.circular(10),
                                          topRight: Radius.circular(10)),
                                    ),
                                    child: Image.network(
                                      '${data.productData[index].image}',
                                    )),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(12, 6, 0, 2),
                                  child: design
                                      .smallText(data.productData[index].name),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12),
                                  child: Row(children: [
                                    design.amount(
                                        design.ash,
                                        12.0,
                                        data.productData[index].price
                                            .toString(),
                                        FontWeight.w500),
                                    const Spacer(),
                                    const Icon(Icons.favorite_outline,
                                        size: 12, color: Color(0xff0d0d0d))
                                  ]),
                                )
                              ],
                            ),
                          ),
                        )),
              ),
            );
          })
        ],
      ),
    ));
  }
}
