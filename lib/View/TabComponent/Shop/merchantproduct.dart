import 'package:creadlymobile/View/TabComponent/Shop/searchproduct.dart';
import 'package:creadlymobile/View/style.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../Model/Core/productdata.dart';
import '../../../Provider/productprovider.dart';
import 'productdetail.dart';

class MerchantProduct extends StatefulWidget {
  final String id;
  const MerchantProduct({Key? key, required this.id}) : super(key: key);

  @override
  State<MerchantProduct> createState() => _MerchantProductState();
}

class _MerchantProductState extends State<MerchantProduct> {
  Widget smalltext(text) {
    return Text(
      text,
      style: const TextStyle(
          color: Color(0xff8e8e8e), fontSize: 10, fontWeight: FontWeight.w400),
    );
  }

  @override
  Widget build(BuildContext context) {
    final design = Ui();
    final width = MediaQuery.of(context).size.width;
    return design.layout(FutureBuilder<List<ProductData>>(
        future: Provider.of<ProductProvider>(context, listen: false)
            .performMerchantQuery(widget.id),
        builder: (context, snapshot) {
          if (snapshot.connectionState.name == 'done') {
            // print(snapshot.data![0].name);
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(25, 10, 25, 50),
                child: Column(
                  children: [
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
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                smalltext('Search'),
                                design.hspacer(12),
                                const Icon(Icons.search,
                                    size: 10, color: Color(0xff8E8E8E))
                              ])),
                    ),
                    design.hspacer(15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            width: 124,
                            height: 40,
                            padding:
                                const EdgeInsets.symmetric(horizontal: 15.3),
                            decoration: BoxDecoration(
                              color: const Color(0xffF8F8FA),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  smalltext('Filter'),
                                  Transform.rotate(
                                      angle: 55,
                                      child: Icon(Icons.arrow_back_ios,
                                          size: 10, color: design.darkPurple))
                                ])),
                        Container(
                            width: 124,
                            height: 40,
                            padding:
                                const EdgeInsets.symmetric(horizontal: 15.3),
                            decoration: BoxDecoration(
                              color: const Color(0xffF8F8FA),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  smalltext('Category'),
                                  Transform.rotate(
                                      angle: 55,
                                      child: Icon(Icons.arrow_back_ios,
                                          size: 10, color: design.darkPurple))
                                ])),
                        Container(
                            alignment: Alignment.center,
                            width: 49,
                            height: 40,
                            decoration: BoxDecoration(
                                color: design.blue,
                                borderRadius: BorderRadius.circular(5)),
                            child: const Icon(Icons.check,
                                size: 11, color: Colors.white)),
                      ],
                    ),
                    design.hspacer(30),
                    GridView.count(
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
                                                bottomLeft: Radius.circular(10),
                                                bottomRight:
                                                    Radius.circular(10),
                                                topRight: Radius.circular(10)),
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
                  ],
                ),
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
        }));
  }
}
