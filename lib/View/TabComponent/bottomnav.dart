import 'package:creadlymobile/View/TabComponent/Shop/shop.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'Order/order.dart';
import 'Profile/profile.dart';
import 'homepage.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({Key? key}) : super(key: key);

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int tabno = 0;
  // PageController controller= PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: tabno,
        children: const [
          Homepage(),
          Shoppage(),
          Orderpage(),
          Profile(),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 2,
        color: const Color(0xffffffff),
        child: SizedBox(
            height: 65,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    IconButton(
                        onPressed: () {
                          setState(() {
                            tabno = 0;
                          });
                        },
                        icon: tabno == 0
                            ? const IconGradient(
                                child: Icon(Icons.home,
                                    color: Colors.white, size: 20),
                              )
                            : const Icon(Icons.home,
                                color: Color(0xffE1E1EC), size: 20)),
                    Text('Home',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 10,
                            color: (tabno == 0)
                                ? const Color(0xff0D0520)
                                : const Color(0xffE1E1EC))),
                  ],
                ),
                Column(
                  children: [
                    IconButton(
                        onPressed: () {
                          setState(() {
                            tabno = 1;
                          });
                        },
                        icon: tabno == 1
                            ? IconGradient(
                                child: SvgPicture.asset('assets/cart.svg',
                                    width: 20, height: 20, color: Colors.white),
                              )
                            : SvgPicture.asset('assets/cart.svg',
                                width: 20,
                                height: 20,
                                color: const Color(0xffE1E1EC))),
                    Text('Shop',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 10,
                            color: (tabno == 1)
                                ? const Color(0xff0D0520)
                                : const Color(0xffE1E1EC))),
                  ],
                ),
                Column(
                  children: [
                    IconButton(
                        onPressed: () {
                          setState(() {
                            tabno = 2;
                          });
                        },
                        icon: tabno == 2
                            ? IconGradient(
                                child: SvgPicture.asset('assets/order.svg',
                                    width: 20, height: 20, color: Colors.white),
                              )
                            : SvgPicture.asset('assets/order.svg',
                                width: 20,
                                height: 20,
                                color: const Color(0xffE1E1EC))),
                    Text('Orders',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 10,
                            color: (tabno == 2)
                                ? const Color(0xff0D0520)
                                : const Color(0xffE1E1EC))),
                  ],
                ),
                Column(
                  children: [
                    IconButton(
                      onPressed: () {
                        setState(() {
                          tabno = 3;
                        });
                      },
                      icon: tabno == 3
                          ? IconGradient(
                              child: SvgPicture.asset('assets/profile.svg',
                                  width: 20, height: 20, color: Colors.white))
                          : SvgPicture.asset('assets/profile.svg',
                              width: 20,
                              height: 20,
                              color: const Color(0xffE1E1EC)),
                    ),
                    Text('Profile',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 10,
                            color: (tabno == 3)
                                ? const Color(0xff0D0520)
                                : const Color(0xffE1E1EC))),
                  ],
                ),
              ],
            )),
      ),
    );
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
        colors: <Color>[Color(0xffB5179E), Color(0xff3A0CA3)],
        tileMode: TileMode.mirror,
      ).createShader(bounds),
      child: child,
    );
  }
}
