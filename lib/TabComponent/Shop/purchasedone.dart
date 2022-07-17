import 'package:creadlymobile/TabComponent/bottomnav.dart';
import 'package:creadlymobile/style.dart';
import 'package:flutter/material.dart';

class PurchaseDone extends StatefulWidget {
  const PurchaseDone({Key? key}) : super(key: key);

  @override
  State<PurchaseDone> createState() => _PurchaseDoneState();
}

class _PurchaseDoneState extends State<PurchaseDone> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final design = Ui();
    return design.layout(Padding(
      padding: const EdgeInsets.fromLTRB(30, 50, 30, 50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          design.hspacer(50),
          Container(
              padding: const EdgeInsets.all(50),
              decoration: const BoxDecoration(
                  image: DecorationImage(
                image: AssetImage('assets/Star 14.png'),
              )),
              child: const Icon(Icons.check, color: Colors.white, size: 30)),
          const Spacer(),
          SizedBox(
              width: width / 2,
              child: design.lineartext('Purchase successfully made')),
          design.hspacer(80),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return const BottomNav();
              }));
            },
            child: Container(
              width: width,
              alignment: Alignment.center,
              height: 50,
              decoration: BoxDecoration(
                  color: design.shadeP,
                  borderRadius: BorderRadius.circular(10)),
              child: Text("Go to Home",
                  style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                      color: design.blue)),
            ),
          )
        ],
      ),
    ));
  }
}
