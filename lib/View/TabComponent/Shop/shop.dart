import 'package:creadlymobile/Model/Core/categorydata.dart';
import 'package:creadlymobile/Model/Core/merchantdata.dart';
import 'package:creadlymobile/Provider/merchantprovider.dart';
import 'package:creadlymobile/View/TabComponent/Shop/allmerchant.dart';
import 'package:creadlymobile/View/TabComponent/Shop/merchantproduct.dart';
import 'package:creadlymobile/View/TabComponent/Shop/searchproduct.dart';
import 'package:creadlymobile/View/style.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

import '../../../Provider/categoryprovider.dart';
import 'categoryProduct.dart';

class Shoppage extends StatefulWidget {
  const Shoppage({Key? key}) : super(key: key);

  @override
  State<Shoppage> createState() => ShoppageState();
}

class ShoppageState extends State<Shoppage> {
  Future<List<CategoryData>>? categoryData;
  Future<List<MerchantData>>? merchantData;
  @override
  void initState() {
    super.initState();
    filterOption = categoryOption;
    categoryData =
        Provider.of<CategoryProvider>(context, listen: false).getCategoryData();
    merchantData =
        Provider.of<MerchantProvider>(context, listen: false).getMerchantData();
    // print(Provider.of<CategoryProvider>(context, listen: true).categorydata);
  }

  Widget smalltext(text) {
    return Text(
      text,
      style: const TextStyle(
          color: Color(0xff8e8e8e), fontSize: 10, fontWeight: FontWeight.w400),
    );
  }

  String filterSub = 'Clothing';
  List<DropdownMenuItem<String>>? filterOption;

  final List<DropdownMenuItem<String>> categoryOption = [
    const DropdownMenuItem<String>(value: 'Clothing', child: Text('Clothing')),
    const DropdownMenuItem<String>(value: 'Gadgets', child: Text('Gadgets')),
    const DropdownMenuItem<String>(
        value: 'Automobiles', child: Text('Automobiles')),
    const DropdownMenuItem<String>(
        value: 'Electronics', child: Text('Electronics')),
    const DropdownMenuItem<String>(value: 'Skincare', child: Text('Skincare')),
  ];
  final List<DropdownMenuItem<String>> priceOption = [
    const DropdownMenuItem<String>(value: '0-40,000', child: Text('0-40,000')),
    const DropdownMenuItem<String>(
        value: '40,000-80,000',
        child: Text(
          '40,000-80,000',
        )),
    const DropdownMenuItem<String>(
        value: '80,000-200,000', child: Text('80,000-200,000')),
    const DropdownMenuItem<String>(
        value: '200,000-600,000', child: Text('200,000-600,000')),
  ];

  String filter = 'Category';
  @override
  Widget build(BuildContext context) {
    final design = Ui();
    final width = MediaQuery.of(context).size.width;
    return design.layout(SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(25, 25, 25, 20),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Center(
              child: Text(
                'Shop',
                style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w700,
                    color: design.blue),
              ),
            ),
            design.hspacer(35),
            GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return const Searchproduct();
                }));
              },
              child: Container(
                  width: width,
                  height: 40,
                  padding: const EdgeInsets.only(right: 15.3),
                  decoration: BoxDecoration(
                    color: const Color(0xffF8F8FA),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child:
                      Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                    smalltext('Search'),
                    design.hspacer(12),
                    const Icon(Icons.search, size: 10, color: Color(0xff8E8E8E))
                  ])),
            ),
            design.hspacer(15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    width: 150,
                    height: 40,
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      color: const Color(0xffF8F8FA),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(child: smalltext(filter)),
                          Expanded(
                            flex: 1,
                            child: DropdownButton<String>(
                              isExpanded: true,
                              underline: const SizedBox(),
                              icon: Transform.rotate(
                                  angle: 55,
                                  child: Icon(Icons.arrow_back_ios,
                                      size: 10, color: design.darkPurple)),
                              onChanged: (String? value) {
                                setState(() {
                                  filter = value!;
                                });
                                if (filter == 'Category') {
                                  setState(() {
                                    filterOption = categoryOption;
                                  });
                                } else {
                                  setState(() {
                                    filterOption = priceOption;
                                  });
                                }
                              },
                              items: const [
                                DropdownMenuItem<String>(
                                    value: 'Category', child: Text('Category')),
                                DropdownMenuItem<String>(
                                    value: 'Price', child: Text('Price(N)')),
                                DropdownMenuItem<String>(
                                    value: 'Brand', child: Text('Brand')),
                              ],
                            ),
                          )
                        ])),
                Container(
                    width: 130,
                    height: 40,
                    padding: const EdgeInsets.symmetric(horizontal: 6.3),
                    decoration: BoxDecoration(
                      color: const Color(0xffF8F8FA),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(child: smalltext(filterSub)),
                          Expanded(
                            child: DropdownButton<String>(
                                isExpanded: true,
                                underline: const SizedBox(),
                                icon: Transform.rotate(
                                    angle: 55,
                                    child: Icon(Icons.arrow_back_ios,
                                        size: 10, color: design.darkPurple)),
                                onChanged: (String? value) {
                                  setState(() {
                                    filterSub = value!;
                                  });
                                },
                                items: filterOption),
                          )
                        ])),
                Container(
                    alignment: Alignment.center,
                    width: 49,
                    height: 40,
                    decoration: BoxDecoration(
                        color: design.blue,
                        borderRadius: BorderRadius.circular(5)),
                    child:
                        const Icon(Icons.check, size: 11, color: Colors.white)),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 25,
                bottom: 25,
              ),
              child: Text(
                'Category',
                style: TextStyle(
                    color: design.ash,
                    fontSize: 15,
                    fontWeight: FontWeight.w700),
              ),
            ),
            Consumer<CategoryProvider>(builder: (context, data, child) {
              // print(data);
              return StreamBuilder<List<CategoryData>>(
                  stream: data.getData(),
                  builder: (context, snapshot) {
                    print(snapshot.connectionState);
                    if (snapshot.connectionState == ConnectionState.done) {
                      List<CategoryData> result = snapshot.data!;
                      return GridView.count(
                        shrinkWrap: true,
                        crossAxisCount: 4,
                        childAspectRatio: 0.7,
                        crossAxisSpacing: 15.0,
                        mainAxisSpacing: 10.0,
                        physics: const ScrollPhysics(),
                        children: List.generate(result.length, (index) {
                          String image = result[index].imageUrl.toString();
                          String id = result[index].id!;
                          return GestureDetector(
                            onTap: () {
                              Navigator.of(context)
                                  .push(MaterialPageRoute(builder: (context) {
                                return CategoryProduct(id: id);
                              }));
                            },
                            child: Column(
                              children: [
                                Container(
                                  width: 55,
                                  height: 55,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: design.shadeP,
                                      shape: BoxShape.circle),
                                  child: Image.network(image),
                                  // child: SvgPicture.asset('assets/shopicon/ipad.svg'),
                                ),
                                design.hspacer(10),
                                smalltext(result[index].name)
                              ],
                            ),
                          );
                        }),
                      );
                    }
                    if (snapshot.connectionState == ConnectionState.active) {
                      return Center(
                        child: Wrap(
                            spacing: 15,
                            // mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(
                              4,
                              (index) => Shimmer.fromColors(
                                baseColor: const Color(0xFFEBEBF4),
                                highlightColor:
                                    const Color(0xFFEBEBF4).withOpacity(0.1),
                                // loop: 5,
                                enabled: true,
                                // period: const Duration(milliseconds: 1500),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10.0, horizontal: 10),
                                  child: Container(
                                    height: 55,
                                    width: 55,
                                    decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Color(0xFFEBEBF4)),

                                    // borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                            )),
                      );
                    }

                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Wrap(
                        spacing: 15,
                        children: List.generate(
                            4,
                            (index) => Shimmer.fromColors(
                                  baseColor: const Color(0xFFEBEBF4),
                                  highlightColor:
                                      const Color(0xFFEBEBF4).withOpacity(0.1),
                                  // loop: 5,
                                  enabled: true,
                                  // period: const Duration(milliseconds: 1500),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10.0),
                                    child: Container(
                                      height: 55,
                                      width: 55,
                                      decoration: const BoxDecoration(
                                          color: Color(0xFFEBEBF4),
                                          shape: BoxShape.circle),

                                      // borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                )),
                      );
                    } else {
                      return Wrap(
                        spacing: 15,
                        children: List.generate(
                            4,
                            (index) => Shimmer.fromColors(
                                  baseColor: const Color(0xFFEBEBF4),
                                  highlightColor:
                                      const Color(0xFFEBEBF4).withOpacity(0.1),
                                  // loop: 5,
                                  enabled: true,
                                  // period: const Duration(milliseconds: 1500),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10.0),
                                    child: Container(
                                      height: 55,
                                      width: 55,
                                      decoration: const BoxDecoration(
                                          color: Color(0xFFEBEBF4),
                                          shape: BoxShape.circle),

                                      // borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                )),
                      );
                    }
                  });
            }),
            Padding(
              padding: const EdgeInsets.only(
                top: 30,
                bottom: 20,
              ),
              child: Row(
                children: [
                  Text(
                    'Merchant',
                    style: TextStyle(
                        color: design.ash,
                        fontSize: 15,
                        fontWeight: FontWeight.w700),
                  ),
                  const Spacer(),
                  Builder(builder: (BuildContext context) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (BuildContext context) {
                          return const AllMerchantPage();
                        }));
                      },
                      child: Text(
                        'View all',
                        style: TextStyle(
                            color: design.blue,
                            fontSize: 10,
                            fontWeight: FontWeight.w500),
                      ),
                    );
                  }),
                ],
              ),
            ),
            Consumer<MerchantProvider>(builder: (context, data, child) {
              return FutureBuilder<List<MerchantData>>(
                  future: merchantData,
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return const Text('error');
                    }
                    if (snapshot.connectionState.name == 'done') {
                      final result = snapshot.data!;

                      return Center(
                        child: GridView.count(
                          // crossAxisCount: 2,
                          shrinkWrap: true,
                          crossAxisCount: 2,
                          childAspectRatio: 1.1,
                          crossAxisSpacing: 12.0,
                          mainAxisSpacing: 10.0,
                          physics: const ScrollPhysics(),
                          children: List.generate(
                              result.length,
                              (index) => GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (BuildContext context) {
                                        return MerchantProduct(
                                            id: result[index].id!);
                                      }));
                                    },
                                    child: Container(
                                      height: 120,
                                      alignment: Alignment.topCenter,
                                      decoration: BoxDecoration(
                                        color: const Color(0xffFfFfFf),
                                        border: Border.all(
                                            width: 1,
                                            color: const Color(0xfff8f8f8)),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Column(
                                        children: [
                                          Container(
                                            height: 100,
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
                                                'https://visaapplicationdocuments.s3.amazonaws.com/2790021660482906703.jpg'),

                                            // child: SvgPicture.asset(
                                            //                       'assets/shopicon/shoplogo.svg')
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(12.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(result[index].shopName!,
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: design.ash)),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: const [
                                                    Text(
                                                      '',
                                                      style: TextStyle(
                                                          color:
                                                              Color(0xff8e8e8e),
                                                          fontSize: 8,
                                                          fontWeight:
                                                              FontWeight.w400),
                                                    ),
                                                    Icon(Icons.star_outline,
                                                        size: 12.7,
                                                        color:
                                                            Color(0xffFFB800))
                                                  ],
                                                )
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  )),
                        ),
                      );
                    }
                    if (snapshot.connectionState.name == 'none') {
                      return design.loadingProgress();
                    } else {
                      return design.loadingProgress();
                    }
                  });
            })
          ]),
        ),
      ),
    ));
  }
}
