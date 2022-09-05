import 'package:creadlymobile/Provider/login.dart';
import 'package:creadlymobile/View/Auth/userregistration.dart';
import 'package:creadlymobile/View/TabComponent/Profile/card.dart';
import 'package:creadlymobile/View/TabComponent/Profile/notification.dart';
import 'package:creadlymobile/View/TabComponent/Profile/transaction.dart';
import 'package:creadlymobile/View/TabComponent/Profile/userinfo.dart';
import 'package:creadlymobile/View/TabComponent/Profile/wishlist.dart';
import 'package:creadlymobile/View/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../../Provider/userdataprovider.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class ListItem {
  String title;
  Widget icon;
  Widget nav;

  ListItem({
    required this.icon,
    required this.title,
    required this.nav,
  });
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    final design = Ui();
    List<ListItem> listitems = [
      ListItem(
          icon: SvgPicture.asset(
            'assets/id.svg',
          ),
          title: 'Add ID Verification',
          nav: const Registration()),
      ListItem(
          icon: SvgPicture.asset(
            'assets/profile.svg',
            color: design.productblack,
            width: 14,
            height: 8,
          ),
          title: 'Info',
          nav: const Userinfo()),
      ListItem(
          icon: const Icon(Icons.favorite_outline,
              size: 14, color: Color(0xffD94848)),
          title: 'Wish list',
          nav: const Wishlist()),
      ListItem(
          icon: const Icon(Icons.send_outlined,
              size: 14, color: Color(0xffB5179E)),
          title: 'Transaction History',
          nav: const Transaction()),
      ListItem(
          icon: Icon(Icons.notifications, size: 14, color: design.blue),
          title: 'Notifications',
          nav: const Notificationpage()),
      ListItem(
          icon: SvgPicture.asset(
            'assets/card.svg',
          ),
          title: 'Bank Accounts',
          nav: const Cardpage()),
      // ListItem(
      //     icon: SvgPicture.asset(
      //       'assets/credit.svg',
      //     ),
      //     title: 'Referrals & Credit Points',
      //     nav: const Referral()),
    ];

    return design.layout(SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(25, 25, 25, 0),
        child: Column(
          children: [
            Text(
              'Profile',
              style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w700,
                  color: design.blue),
            ),
            Row(
              children: [
                Container(
                  width: 109,
                  height: 109,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(1),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(55),
                      gradient: const LinearGradient(
                          colors: [Color(0xffB5179E), Color(0xff3A0CA3)])),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(55),
                      child: Image.asset(
                        'assets/man.png',
                        fit: BoxFit.fill,
                        width: 109,
                        height: 109,
                      )),
                ),
                design.wspacer(10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Consumer<UserDataProvider>(builder: (context, data, child) {
                      return Text(
                        'Hello ${data.firstName}',
                        style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w700,
                            color: design.productblack),
                      );
                    }),
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          var snackBar = SnackBar(
                            backgroundColor: Colors.white,
                            content: Text(
                              'Copied!',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w500,
                                  color: design.ash),
                            ),
                          );
                          Clipboard.setData(
                              const ClipboardData(text: "Credley/kanyetgev"));
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        },
                        child: Container(
                          width: 136,
                          height: 21,
                          alignment: Alignment.center,
                          margin: const EdgeInsets.symmetric(vertical: 5),
                          // padding: const EdgeInsets.fromLTRB(10, 5, 5, 5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(3),
                              color: design.shadeP.withOpacity(0.2)),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Credley/kanyetgev',
                                style: TextStyle(
                                    fontSize: 10.0,
                                    fontWeight: FontWeight.w500,
                                    color: design.ash),
                              ),
                              design.wspacer(5),
                              Icon(Icons.copy, color: design.blue, size: 9.17)
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Column(
                children: List.generate(
                    listitems.length,
                    (index) => Column(
                          children: [
                            ListTile(
                              onTap: () {
                                Navigator.of(context)
                                    .push(MaterialPageRoute(builder: (context) {
                                  return listitems[index].nav;
                                }));
                              },
                              leading: Container(
                                width: 30,
                                alignment: Alignment.center,
                                height: 30,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                          blurRadius: 0.1,
                                          offset:
                                              Offset.fromDirection(0.2, 0.2),
                                          color: Colors.grey)
                                    ]),
                                child: listitems[index].icon,
                              ),
                              title: Text(
                                listitems[index].title,
                                style: TextStyle(
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.w500,
                                    color: design.ash),
                              ),
                            ),
                            const Divider(),
                          ],
                        ))),
            GestureDetector(
              onTap: () {
                Provider.of<LoginProvider>(context, listen: false)
                    .updateAuth('');
              },
              child: ListTile(
                leading: Container(
                  width: 30,
                  alignment: Alignment.center,
                  height: 30,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: const Color(0xffFFE9E9),
                      boxShadow: [
                        BoxShadow(
                            offset: Offset.fromDirection(0.1, 0.1),
                            color: Colors.grey)
                      ]),
                  child: const Icon(
                    Icons.logout_outlined,
                    color: Color(0xffFF4848),
                    size: 14,
                  ),
                ),
                title: Text(
                  'Log out',
                  style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.w500,
                      color: design.ash),
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
