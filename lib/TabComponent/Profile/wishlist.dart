import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../style.dart';

class Wishlist extends StatefulWidget {
  const Wishlist({Key? key}) : super(key: key);

  @override
  State<Wishlist> createState() => _WishlistState();
}

class _WishlistState extends State<Wishlist> {
  @override
  Widget build(BuildContext context) {
    final design = Ui();
    final width = MediaQuery.of(context).size.width;

    return design.layout(SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
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
                design.title('Wishlist'),
              ],
            ),
            design.hspacer(24),
            Column(
                children: List.generate(
              10,
              (index) => Container(
                width: width,
                height: 60,
                // padding: const EdgeInsets.all(5),
                margin: const EdgeInsets.symmetric(vertical: 10),
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
                          design.amount(
                              design.ash, 12.0, '500,000', FontWeight.w500),
                        ],
                      ),
                      const Spacer(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Builder(builder: (context) {
                            List<Widget> star = List.filled(
                                5,
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
                          design.hspacer(10),
                          const Icon(Icons.favorite,
                              size: 14, color: Color(0xffD94848))
                        ],
                      )
                    ]),
              ),
            ))
          ],
        ),
      ),
    ));
  }
}
