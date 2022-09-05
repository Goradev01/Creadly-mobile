import 'package:creadlymobile/Model/Core/merchantdata.dart';
import 'package:creadlymobile/Provider/merchantprovider.dart';
import 'package:creadlymobile/View/TabComponent/Shop/merchantproduct.dart';
import 'package:creadlymobile/View/style.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AllMerchantPage extends StatefulWidget {
  const AllMerchantPage({Key? key}) : super(key: key);

  @override
  State<AllMerchantPage> createState() => AllMerchantPageState();
}

class AllMerchantPageState extends State<AllMerchantPage> {
  Future<List<MerchantData>>? merchantData;
  @override
  void initState() {
    super.initState();

    // Provider.of<CategoryProvider>(context, listen: false).getCategoryData();
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

  @override
  Widget build(BuildContext context) {
    final design = Ui();

    return design.layout(SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(25, 25, 25, 20),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Center(
              child: Text(
                'All Merchants',
                style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w700,
                    color: design.blue),
              ),
            ),
            design.hspacer(35),
            Consumer<MerchantProvider>(builder: (context, data, child) {
              return FutureBuilder<List<MerchantData>>(
                  future: merchantData,
                  builder: (context, snapshot) {
                    final result = snapshot.data!;
                    if (snapshot.connectionState.name == 'done') {
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
                    } else {
                      return design.shimmerProduct(6);
                    }
                  });
            })
          ]),
        ),
      ),
    ));
  }
}
