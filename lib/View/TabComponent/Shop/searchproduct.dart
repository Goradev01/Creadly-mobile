import 'package:creadlymobile/View/style.dart';
import 'package:flutter/material.dart';

class Searchproduct extends StatefulWidget {
  const Searchproduct({Key? key}) : super(key: key);

  @override
  State<Searchproduct> createState() => _SearchproductState();
}

class Product {
  String title;
  String amount;
  String imageurl;

  Product({
    required this.title,
    required this.amount,
    required this.imageurl,
  });
}

class _SearchproductState extends State<Searchproduct> {
  Widget smalltext(text) {
    return Text(
      text,
      style: const TextStyle(
          color: Color(0xff8e8e8e), fontSize: 10, fontWeight: FontWeight.w400),
    );
  }

  List<Product> products = [
    Product(
        title: 'Hisense Refrigerator...',
        amount: '500,000',
        imageurl: 'fridge'),
    Product(title: 'Samsung Split Air C...', amount: '70,000', imageurl: 'ac'),
    Product(title: 'I Mac 47 Inches', amount: '500,000', imageurl: 'imac'),
    Product(title: 'Nike Sneakers AF683', amount: '70,000', imageurl: 'shoe'),
    Product(
        title: 'Black Stylish Beanie', amount: '500,000', imageurl: 'beanie'),
    Product(title: 'LG Microwave', amount: '70,000', imageurl: 'machine'),
  ];
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final design = Ui();
    return design.layout(SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
              Container(
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
              design.hspacer(15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      width: 124,
                      height: 40,
                      padding: const EdgeInsets.symmetric(horizontal: 15.3),
                      decoration: BoxDecoration(
                        color: const Color(0xffF8F8FA),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                      padding: const EdgeInsets.symmetric(horizontal: 15.3),
                      decoration: BoxDecoration(
                        color: const Color(0xffF8F8FA),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
              Padding(
                padding: const EdgeInsets.only(
                  top: 25,
                  bottom: 25,
                ),
                child: Text(
                  'Search results',
                  style: TextStyle(
                      color: design.ash,
                      fontSize: 15,
                      fontWeight: FontWeight.w700),
                ),
              ),
              GridView.count(
                // crossAxisCount: 2,
                shrinkWrap: true,
                crossAxisCount: 2,
                childAspectRatio: 1.18,
                crossAxisSpacing: 15.0,
                mainAxisSpacing: 10.0,
                physics: const ScrollPhysics(),
                children: List.generate(
                    products.length,
                    (index) => Container(
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
                                padding: const EdgeInsets.fromLTRB(12, 6, 0, 2),
                                child: smalltext(products[index].title),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 12),
                                child: Row(children: [
                                  design.amount(design.ash, 12.0,
                                      products[index].amount, FontWeight.w500),
                                  const Spacer(),
                                  const Icon(Icons.favorite_outline,
                                      size: 12, color: Color(0xff0d0d0d))
                                ]),
                              )
                            ],
                          ),
                        )),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
