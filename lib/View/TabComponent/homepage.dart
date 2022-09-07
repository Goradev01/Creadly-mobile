import 'package:creadlymobile/Model/Core/bnlp.dart';
import 'package:creadlymobile/Model/Core/productdata.dart';
import 'package:creadlymobile/Model/Core/userdata.dart';
import 'package:creadlymobile/Provider/userdataprovider.dart';
import 'package:creadlymobile/View/Auth/verification.dart';
import 'package:creadlymobile/View/TabComponent/BNPL/bnpl.dart';
import 'package:creadlymobile/View/TabComponent/Salary-Advanced/salary.dart';
import 'package:creadlymobile/View/TabComponent/Shop/allproduct.dart';
import 'package:creadlymobile/View/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

import '../../Provider/bnplprovider.dart';
import '../../Provider/productprovider.dart';
import 'Shop/productdetail.dart';
import 'ondemand/ondemand.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class CreditModel {
  String title;
  String name;
  int id;
  String mode;
  Color color;

  CreditModel({
    required this.title,
    required this.id,
    required this.mode,
    required this.name,
    required this.color,
  });
}

class _HomepageState extends State<Homepage> {
  Future<List<BnplData>>? creditModel;
  int creditmodelno = 0;
  bool newuser = true;
  Future<List<UserData>>? userData;
  Future<List<ProductData>>? hotDeal;
  Future<List<ProductData>>? productData;

  @override
  void initState() {
    super.initState();
    creditModel = Provider.of<BnplProvider>(context, listen: false).getData();
    hotDeal =
        Provider.of<ProductProvider>(context, listen: false).getHotDealData();
    productData =
        Provider.of<ProductProvider>(context, listen: false).getProductData();
    userData =
        Provider.of<UserDataProvider>(context, listen: false).getUserData();
    Provider.of<UserDataProvider>(context, listen: false).getUserData().then(
        (value) => Provider.of<UserDataProvider>(context, listen: false)
            .updateDetail(
                value[0].email!,
                value[0].firstName!,
                value[0].lastName!,
                value[0].companyCode!,
                value[0].bvn!,
                value[0].dateOfBirth!,
                value[0].address!,
                value[0].phoneNumber!));
    print(Provider.of<UserDataProvider>(context, listen: false).firstName);
  }

  List<CreditModel> creditmodel = [
    CreditModel(
        title: 'BNPL Balance',
        name: 'bnpl',
        mode: 'Make Request',
        id: 0,
        color: const Color(0xff3A0CA3)),
    CreditModel(
        title: 'Salary Advance',
        mode: 'Withdraw',
        id: 1,
        name: 'salaryAdvance',
        color: const Color(0xffCB32B5)),
    CreditModel(
        title: 'On Demand',
        mode: 'Withdraw',
        id: 2,
        name: 'onDemand',
        color: Colors.yellow),
  ];

  @override
  Widget build(BuildContext context) {
    final design = Ui();
    final width = MediaQuery.of(context).size.width;

    return design.layout(SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Consumer<UserDataProvider>(builder: (context, data, child) {
            return FutureBuilder<List<UserData>>(
                future: userData,
                builder: ((context, snapshot) {
                  if (snapshot.connectionState.name == 'done') {
                    return Container(
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
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 5),
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 5, 10, 5),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: const Color(0xffD11919)
                                          .withOpacity(0.2)),
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
                                      snapshot.data?[0].firstName != null
                                          ? 'Hello ${snapshot.data?[0].firstName},'
                                          : 'Hello',
                                      style: TextStyle(
                                          fontSize: 18.0,
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
                                  gradient: const LinearGradient(colors: [
                                    Color(0xffB5179E),
                                    Color(0xff3A0CA3)
                                  ])),
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
                    );
                  }
                  if (snapshot.connectionState.name == 'waiting') {
                    return Shimmer.fromColors(
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
                        ));
                  } else {
                    return Shimmer.fromColors(
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
                        ));
                  }
                }));
          }),
          Center(
            child: Consumer<BnplProvider>(builder: (context, data, child) {
              return FutureBuilder<List<BnplData>>(
                  future: creditModel,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState.name == 'waiting') {
                      return Shimmer.fromColors(
                          baseColor: const Color(0xFFEBEBF4),
                          highlightColor:
                              const Color(0xFFEBEBF4).withOpacity(0.1),
                          // loop: 5,
                          enabled: true,
                          // period: const Duration(milliseconds: 1500),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(30, 30, 30, 10),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              height: 136,
                            ),
                          ));
                    }
                    if (snapshot.connectionState.name == 'done') {
                      return Padding(
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
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) {
                                          return Bnpl(
                                            amount: snapshot.data!.isNotEmpty
                                                ? snapshot
                                                    .data![0]
                                                    .data![
                                                        creditmodel[index].name]
                                                    .toString()
                                                : '0',
                                          );
                                        }));
                                      } else if (index == 2) {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) {
                                          return Ondemand(
                                            amount: snapshot.data!.isNotEmpty
                                                ? snapshot
                                                    .data![0]
                                                    .data![
                                                        creditmodel[index].name]
                                                    .toString()
                                                : '0',
                                          );
                                        }));
                                      } else {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) {
                                          return SalaryAdvanced(
                                            amount: snapshot.data!.isNotEmpty
                                                ? snapshot
                                                    .data![0]
                                                    .data![
                                                        creditmodel[index].name]
                                                    .toString()
                                                : '--',
                                          );
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
                                                  design.naira(
                                                      Colors.white, 32.0),
                                                  Text(
                                                    !newuser
                                                        ? '--'
                                                        : snapshot.data!
                                                                .isNotEmpty
                                                            ? snapshot
                                                                .data![0]
                                                                .data![
                                                                    creditmodel[
                                                                            index]
                                                                        .name]
                                                                .toString()
                                                            : '--',
                                                    style: const TextStyle(
                                                        fontSize: 32.0,
                                                        fontWeight:
                                                            FontWeight.w700,
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
                                                          BorderRadius.circular(
                                                              5),
                                                      color: const Color(
                                                              0xffffffff)
                                                          .withOpacity(0.5)),
                                                  child: Text(
                                                    creditmodel[index].mode,
                                                    style: const TextStyle(
                                                        fontSize: 10.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color:
                                                            Color(0xffffffff)),
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
                          ));
                    } else {
                      return Shimmer.fromColors(
                          baseColor: const Color(0xFFEBEBF4),
                          highlightColor:
                              const Color(0xFFEBEBF4).withOpacity(0.1),
                          // loop: 5,
                          enabled: true,
                          // period: const Duration(milliseconds: 1500),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(30, 30, 30, 10),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              height: 136,
                            ),
                          ));
                    }
                  });
            }),
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
          Consumer<UserDataProvider>(builder: (context, data, child) {
            return FutureBuilder<List<UserData>>(
                future: userData,
                builder: (context, snapshot) {
                  if (snapshot.connectionState.name == 'done') {
                    return Visibility(
                      visible: snapshot.data?[0].isIDVerified != true,
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(30.0),
                          child: GestureDetector(
                            onTap: () {
                              design.nav(context, const Verificationpage());
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
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                            child: design.smallineartext(
                                                '50%', 10),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      design.input(
                                          Colors.white,
                                          15,
                                          'Complete your registration',
                                          FontWeight.w500),
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
                    );
                  }
                  // if (snapshot.connectionState.name == 'waiting') {
                  //   return SizedBox(
                  //     width: width,
                  //     height: 114,
                  //   );
                  // }
                  else {
                    return SizedBox(
                      width: width,
                      height: 24,
                      // decoration: const BoxDecoration(color: Color(0xffEDE9F7)),
                    );
                  }
                });
          }),
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
                child:
                    Consumer<ProductProvider>(builder: (context, data, child) {
                  return FutureBuilder<List<ProductData>>(
                      future: hotDeal,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState.name == 'done') {
                          return SizedBox(
                              height: 160,
                              child: ListView.builder(
                                  itemCount: snapshot.data!.length,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    return GestureDetector(
                                      onTap: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) {
                                          return Productdetail(
                                              id: snapshot.data![index].id!);
                                        }));
                                      },
                                      child: Container(
                                        height: 150,
                                        width: 150,
                                        margin: const EdgeInsets.all(5),
                                        alignment: Alignment.topCenter,
                                        decoration: BoxDecoration(
                                          color: const Color(0xffFfFfFf),
                                          border: Border.all(
                                              width: 1,
                                              color: const Color(0xfff8f8f8)),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                                height: 100,
                                                width: (width - 50 - 15) / 2,
                                                padding:
                                                    const EdgeInsets.all(12),
                                                decoration: const BoxDecoration(
                                                  color: Color(0xffF6F6F6),
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  10),
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  10),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  10),
                                                          topRight:
                                                              Radius.circular(
                                                                  10)),
                                                ),
                                                child: Image.network(
                                                  snapshot.data![index].image!,
                                                )),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      12, 6, 0, 2),
                                              child: design.smallText(
                                                  snapshot.data![index].name),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 12),
                                              child: Row(children: [
                                                design.amount(
                                                    design.ash,
                                                    12.0,
                                                    snapshot.data![index].price
                                                        .toString(),
                                                    FontWeight.w500),
                                                const Spacer(),
                                                const Icon(
                                                    Icons.favorite_outline,
                                                    size: 12,
                                                    color: Color(0xff0d0d0d))
                                              ]),
                                            )
                                          ],
                                        ),
                                      ),
                                    );
                                  }));
                        }
                        if (snapshot.connectionState.name == 'waiting') {
                          return SizedBox(
                            height: 160,
                            width: width,
                            child: Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(25, 10, 25, 50),
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: 5,
                                  itemBuilder: ((context, index) {
                                    return Shimmer.fromColors(
                                        baseColor: const Color(0xFFEBEBF4),
                                        highlightColor: const Color(0xFFEBEBF4)
                                            .withOpacity(0.1),
                                        // loop: 5,
                                        enabled: true,
                                        // period: const Duration(milliseconds: 1500),
                                        child: Container(
                                          height: 150,
                                          width: 150,
                                          margin: const EdgeInsets.all(5),
                                          decoration: BoxDecoration(
                                            color: const Color(0xffFfFfFf),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                        ));
                                  })),
                            ),
                          );
                        } else {
                          return SizedBox(
                            height: 160,
                            width: width,
                            child: Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(25, 10, 25, 50),
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: 5,
                                  itemBuilder: ((context, index) {
                                    return Shimmer.fromColors(
                                        baseColor: const Color(0xFFEBEBF4),
                                        highlightColor: const Color(0xFFEBEBF4)
                                            .withOpacity(0.1),
                                        // loop: 5,
                                        enabled: true,
                                        // period: const Duration(milliseconds: 1500),
                                        child: Container(
                                          height: 150,
                                          width: 150,
                                          margin: const EdgeInsets.all(5),
                                          decoration: BoxDecoration(
                                            color: const Color(0xffFfFfFf),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                        ));
                                  })),
                            ),
                          );
                        }
                      });
                }),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(25, 10, 25, 10),
            child: Row(
              children: [
                design.input(design.ash, 15, "Products", FontWeight.w700),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (BuildContext context) {
                      return const AllProduct();
                    }));
                  },
                  child: Text(
                    'View all',
                    style: TextStyle(
                        color: design.blue,
                        fontSize: 10,
                        fontWeight: FontWeight.w500),
                  ),
                )
              ],
            ),
          ),
          Consumer<ProductProvider>(builder: (context, data, child) {
            return FutureBuilder<List<ProductData>>(
                future: productData,
                builder: (context, snapshot) {
                  if (snapshot.connectionState.name == 'done') {
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
                            snapshot.data!.length,
                            (index) => GestureDetector(
                                  onTap: () {
                                    final id = snapshot.data![index].id!;
                                    Navigator.of(context).push(
                                        MaterialPageRoute(builder: (context) {
                                      return Productdetail(id: id);
                                    }));
                                  },
                                  child: Container(
                                    alignment: Alignment.topCenter,
                                    decoration: BoxDecoration(
                                      color: const Color(0xffFfFfFf),
                                      border: Border.all(
                                          width: 1,
                                          color: const Color(0xfff8f8f8)),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                            height: 100,
                                            width: (width - 50 - 15) / 2,
                                            padding: const EdgeInsets.all(12),
                                            decoration: const BoxDecoration(
                                              color: Color(0xffF6F6F6),
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(10),
                                                  bottomLeft:
                                                      Radius.circular(10),
                                                  bottomRight:
                                                      Radius.circular(10),
                                                  topRight:
                                                      Radius.circular(10)),
                                            ),
                                            child: Image.network(
                                              '${snapshot.data![index].image}',
                                            )),
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              12, 6, 0, 2),
                                          child: design.smallText(
                                              snapshot.data![index].name),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 12),
                                          child: Row(children: [
                                            design.amount(
                                                design.ash,
                                                12.0,
                                                snapshot.data![index].price
                                                    .toString(),
                                                FontWeight.w500),
                                            const Spacer(),
                                            const Icon(Icons.favorite_outline,
                                                size: 12,
                                                color: Color(0xff0d0d0d))
                                          ]),
                                        )
                                      ],
                                    ),
                                  ),
                                )),
                      ),
                    );
                  }
                  if (snapshot.connectionState.name == 'waiting') {
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(25, 10, 25, 50),
                      child: design.shimmerProduct(
                        4,
                      ),
                    );
                  } else {
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(25, 10, 25, 50),
                      child: design.shimmerProduct(
                        4,
                      ),
                    );
                  }
                });
          })
        ],
      ),
    ));
  }
}
