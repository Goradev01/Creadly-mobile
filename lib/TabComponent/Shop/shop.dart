import 'package:creadlymobile/TabComponent/Shop/productdetail.dart';
import 'package:creadlymobile/TabComponent/Shop/searchproduct.dart';
import 'package:creadlymobile/style.dart';
import 'package:flutter/material.dart';

class Shoppage extends StatefulWidget {
  const Shoppage({Key? key}) : super(key: key);

  @override
  State<Shoppage> createState() => ShoppageState();
}

class ShoppageState extends State<Shoppage> {
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Container(
                      width: 55,
                      height: 55,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: design.shadeP, shape: BoxShape.circle),
                      child: Image.asset('assets/shopicon/ipad.png'),
                      // child: SvgPicture.asset('assets/shopicon/ipad.svg'),
                    ),
                    design.hspacer(10),
                    smalltext('Gadgets')
                  ],
                ),
                Column(
                  children: [
                    Container(
                      width: 55,
                      height: 55,
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                          color: Color(0xffE5FDFF), shape: BoxShape.circle),
                      child: Image.asset('assets/shopicon/nike.png'),
                      // child: SvgPicture.asset('assets/shopicon/shoes.svg'),
                    ),
                    design.hspacer(10),
                    smalltext('Shoes')
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return const Productdetail();
                    }));
                  },
                  child: Column(
                    children: [
                      Container(
                        width: 55,
                        height: 55,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: design.shadePi, shape: BoxShape.circle),
                        child: Image.asset('assets/shopicon/tv.png'),
                        // child: SvgPicture.asset('assets/shopicon/elect.svg'),
                      ),
                      design.hspacer(10),
                      smalltext('Electronics')
                    ],
                  ),
                ),
                Column(
                  children: [
                    Container(
                      width: 55,
                      height: 55,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: design.shadenew, shape: BoxShape.circle),
                      child: Image.asset('assets/shopicon/chair.png'),
                      // child: SvgPicture.asset('assets/shopicon/skincare.svg'),
                    ),
                    design.hspacer(10),
                    smalltext('Furnitures')
                  ],
                ),
              ],
            ),
            design.hspacer(10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Container(
                      width: 55,
                      height: 55,
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                          color: Color(0xffE5FDFF), shape: BoxShape.circle),
                      child: Image.asset('assets/shopicon/fashion.png'),
                      // child: SvgPicture.asset('assets/shopicon/hoodie.svg'),
                    ),
                    design.hspacer(10),
                    smalltext('Clothes')
                  ],
                ),
                Column(
                  children: [
                    Container(
                      width: 55,
                      height: 55,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: design.shadePi, shape: BoxShape.circle),
                      child: Image.asset('assets/shopicon/skincare.png'),
                      // child: SvgPicture.asset('assets/shopicon/skincare.svg'),
                    ),
                    design.hspacer(10),
                    smalltext('Skincare')
                  ],
                ),
                Column(
                  children: [
                    Container(
                      width: 55,
                      height: 55,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: design.shadeP, shape: BoxShape.circle),
                      child: Image.asset('assets/shopicon/car.png'),
                      // child: SvgPicture.asset('assets/shopicon/car.svg'),
                    ),
                    design.hspacer(10),
                    smalltext('Automobile')
                  ],
                ),
                Column(
                  children: [
                    Container(
                      width: 55,
                      height: 55,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: design.shadePi, shape: BoxShape.circle),
                      child: Image.asset('assets/shopicon/laptop.png'),
                      // child: SvgPicture.asset('assets/shopicon/laptop.svg'),
                    ),
                    design.hspacer(10),
                    smalltext('Laptops')
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 40,
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
                  Text(
                    'View all',
                    style: TextStyle(
                        color: design.blue,
                        fontSize: 10,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            Center(
              child: GridView.count(
                // crossAxisCount: 2,
                shrinkWrap: true,
                crossAxisCount: 2,
                childAspectRatio: 1.1,
                crossAxisSpacing: 15.0,
                mainAxisSpacing: 10.0,
                physics: const ScrollPhysics(),
                children: List.generate(
                    4,
                    (index) => Container(
                          height: 120,
                          alignment: Alignment.topCenter,
                          decoration: BoxDecoration(
                            color: const Color(0xffFfFfFf),
                            border: Border.all(
                                width: 1, color: const Color(0xfff8f8f8)),
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
                                      bottomLeft: Radius.circular(10),
                                      bottomRight: Radius.circular(10),
                                      topRight: Radius.circular(10)),
                                ),
                                child:
                                    Image.asset('assets/shopicon/shoplogo.jpg'),

                                // child: SvgPicture.asset(
                                //                       'assets/shopicon/shoplogo.svg')
                              ),
                              Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Obiwezzy.com',
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                            color: design.ash)),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: const [
                                        Text(
                                          'Phone | Gadgets | Gaming',
                                          style: TextStyle(
                                              color: Color(0xff8e8e8e),
                                              fontSize: 8,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        Icon(Icons.star_outline,
                                            size: 12.7,
                                            color: Color(0xffFFB800))
                                      ],
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        )),
              ),
            )
          ]),
        ),
      ),
    ));
  }
}
