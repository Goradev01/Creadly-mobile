import 'package:creadlymobile/Model/Core/productdata.dart';
import 'package:creadlymobile/Provider/addcartprovider.dart';
import 'package:creadlymobile/Provider/productprovider.dart';
import 'package:creadlymobile/View/TabComponent/Shop/merchantproduct.dart';
import 'package:creadlymobile/View/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class Productdetail extends StatefulWidget {
  final String id;
  const Productdetail({Key? key, required this.id}) : super(key: key);

  @override
  State<Productdetail> createState() => _ProductdetailState();
}

class _ProductdetailState extends State<Productdetail> {
  int stock = 0;
  // List<ProductData> data = [];
  Widget smalltext(text) {
    return Text(
      text,
      style: const TextStyle(
          color: Color(0xff8e8e8e), fontSize: 10, fontWeight: FontWeight.w400),
    );
  }

  Future<List<ProductData>>? futuredata;

  @override
  void initState() {
    super.initState();
    futuredata = Provider.of<ProductProvider>(context, listen: false)
        .perProductData(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    final design = Ui();
    return design.layout(SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 30),
          child: Builder(builder: (
            context,
          ) {
            return FutureBuilder<List<ProductData>>(
                future: futuredata,
                builder: (context, snapshot) {
                  if (snapshot.connectionState.name == 'waiting') {
                    return SizedBox(
                        height: 50, child: design.loadingProgress());
                  }
                  if (snapshot.connectionState.name == 'done') {
                    List<ProductData> data = snapshot.data!;
                    return Column(
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
                              design.title(data[0].name),
                            ],
                          ),
                        ),
                        Image.network(data[0].image!),
                        Container(
                            padding: const EdgeInsets.fromLTRB(25, 15, 25, 10),
                            decoration:
                                const BoxDecoration(color: Color(0xfff8f8fa)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Price',
                                    style: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w400,
                                        color: design.pink)),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: 25, top: 10),
                                  child: Row(
                                    children: [
                                      design.amount(
                                          design.ash,
                                          20.0,
                                          data[0].price.toString(),
                                          FontWeight.w500),
                                      const Spacer(),
                                      const Icon(Icons.favorite_outline,
                                          size: 14, color: Colors.black)
                                    ],
                                  ),
                                ),
                                Row(
                                  children: [
                                    Text('Description',
                                        style: TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.w400,
                                            color: design.pink)),
                                    design.hspacer(14.7),
                                    Row(
                                      children: List.generate(
                                          5,
                                          (index) => const Icon(Icons.star,
                                              size: 13,
                                              color: Color(0xffffb800))),
                                    ),
                                    const Spacer(),
                                    Text(data[0].category!['name'],
                                        style: TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.w400,
                                            color: design.ash)),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 10, bottom: 20),
                                  child: smalltext(data[0].description),
                                ),
                                Container(
                                  padding:
                                      const EdgeInsets.fromLTRB(16, 13, 11, 11),
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                  ),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Container(
                                        height: 35,
                                        width: 35,
                                        decoration: BoxDecoration(
                                            color: Colors.grey,
                                            borderRadius:
                                                BorderRadius.circular(17)),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(17),
                                          child: Image.network(
                                            data[0].merchant!['profilePicture'],
                                            height: 50,
                                            width: 50,
                                          ),
                                        ),
                                      ),
                                      design.wspacer(10),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              smalltext('vendor'),
                                              design.wspacer(7),
                                              Builder(builder: (context) {
                                                List<Widget> star = List.filled(
                                                    4,
                                                    SvgPicture.asset(
                                                        'assets/shopicon/starhalf.svg',
                                                        width: 13.55,
                                                        height: 12.95),
                                                    growable: true);
                                                List<Widget> replace = List.generate(
                                                    3,
                                                    (index) => SvgPicture.asset(
                                                        'assets/shopicon/star.svg',
                                                        width: 13.55,
                                                        height: 12.95));
                                                star.replaceRange(
                                                    0, 3, replace);

                                                return Row(
                                                  children: star,
                                                );
                                              })
                                            ],
                                          ),
                                          design.hspacer(5),
                                          Text(data[0].merchant!['shopName'],
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: design.ash,
                                                  fontWeight: FontWeight.w500))
                                        ],
                                      ),
                                      const Spacer(),
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (context) {
                                            return MerchantProduct(
                                                id: data[0].merchant!['_id']);
                                          }));
                                        },
                                        child: Text('View store',
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: design.blue,
                                                fontWeight: FontWeight.w400)),
                                      )
                                    ],
                                  ),
                                ),
                                //! dsg
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 20, bottom: 10),
                                  child: Text('Product Rating',
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: design.blue,
                                          fontWeight: FontWeight.w400)),
                                ),
                                Row(
                                  children: [
                                    Image.asset('assets/shopicon/user2.jpg'),
                                    design.wspacer(20),
                                    smalltext('Medussa_verg'),
                                    const Spacer(),
                                    Builder(builder: (context) {
                                      List<Widget> star = List.filled(
                                          4,
                                          SvgPicture.asset(
                                              'assets/shopicon/starhalf.svg',
                                              width: 13.55,
                                              height: 12.95),
                                          growable: true);
                                      List<Widget> replace = List.generate(
                                          3,
                                          (index) => SvgPicture.asset(
                                              'assets/shopicon/star.svg',
                                              width: 13.55,
                                              height: 12.95));
                                      star.replaceRange(0, 3, replace);

                                      return Row(
                                        children: star,
                                      );
                                    })
                                  ],
                                ),
                              ],
                            )),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(50, 20, 0, 10),
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  // print(data[0].variants!);
                                  if (stock < data[0].quantity!) {
                                    setState(() {
                                      stock = stock + 1;
                                    });
                                  }
                                },
                                child: Container(
                                  height: 28,
                                  alignment: Alignment.center,
                                  width: 28,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      border: Border.all(
                                          width: 1, color: design.shadeP)),
                                  child: Text('+',
                                      style: TextStyle(
                                          fontSize: 14, color: design.blue)),
                                ),
                              ),
                              Container(
                                height: 39,
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                alignment: Alignment.center,
                                width: 39,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: const Color(0xfff8f8f8)),
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
                                  height: 28,
                                  alignment: Alignment.center,
                                  width: 28,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      border: Border.all(
                                          width: 1, color: design.shadeP)),
                                  child: Text('-',
                                      style: TextStyle(
                                          fontSize: 14, color: design.blue)),
                                ),
                              ),
                              design.wspacer(10),
                              GestureDetector(
                                onTap: () {
                                  Provider.of<AddCartProvider>(context,
                                          listen: false)
                                      .updateLoadingCart(true);
                                  Provider.of<AddCartProvider>(context,
                                          listen: false)
                                      .addCart(data[0].id!, context);
                                },
                                child: Container(
                                  // width: width,
                                  alignment: Alignment.center,
                                  height: 50,
                                  width: 169,
                                  decoration: BoxDecoration(
                                      color: design.blue,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: const Text('Add to Cart',
                                      style: TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white)),
                                ),
                              ),
                              design.wspacer(20),
                              Consumer<AddCartProvider>(
                                  builder: (context, data, child) {
                                return Visibility(
                                  visible: data.loadingAddCart,
                                  child: SizedBox(
                                    height: 20,
                                    width: 20,
                                    child: CircularProgressIndicator(
                                        strokeWidth: 3,
                                        // value: 0.5,
                                        color: Colors.white,
                                        backgroundColor: design.blue),
                                  ),
                                );
                              })
                            ],
                          ),
                        )
                      ],
                    );
                  } else {
                    return design.loadingProgress();
                  }
                });
          }),
        ),
      ),
    ));
  }
}

class IconGradient extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const IconGradient({required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) => const LinearGradient(
        colors: <Color>[Color(0xffffb890), Color(0xffffffff)],
        begin: Alignment.bottomLeft,
        end: Alignment.bottomRight,
        tileMode: TileMode.mirror,
      ).createShader(bounds),
      child: child,
    );
  }
}
