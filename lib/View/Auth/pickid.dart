import 'package:creadlymobile/View/Auth/idform.dart';
import 'package:creadlymobile/View/style.dart';
import 'package:flutter/material.dart';

class Pickid extends StatefulWidget {
  const Pickid({Key? key}) : super(key: key);

  @override
  State<Pickid> createState() => _PickidState();
}

class Idslist {
  String title;
  String subtitle;
  Idslist({required this.title, required this.subtitle});
}

class _PickidState extends State<Pickid> {
  List ids = [
    Idslist(
        title: 'Driver’s Liscense',
        subtitle: 'Small Copy of description or something'),
    Idslist(
        title: 'NIN Card', subtitle: 'Small Copy of description or something'),
    Idslist(
        title: 'International Passport',
        subtitle: 'Small Copy of description or something'),
    Idslist(
        title: 'Voter’s ID',
        subtitle: 'Small Copy of description or something'),
  ];
  @override
  Widget build(BuildContext context) {
    final design = Ui();
    final width = MediaQuery.of(context).size.width;

    return design.layout(Padding(
      padding: const EdgeInsets.fromLTRB(25, 35, 25, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
              design.title('Upload Id'),
            ],
          ),
          design.title('Type of ID'),
          design.hspacer(20),
          Column(
              children: List.generate(
                  ids.length,
                  (index) => Container(
                        height: 60,
                        width: width,
                        margin: const EdgeInsets.symmetric(vertical: 5),
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        alignment: Alignment.centerLeft,
                        decoration: BoxDecoration(
                          color: const Color(0xfff8f8fa),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  ids[index].title,
                                  style: const TextStyle(
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xff2E2E2E)),
                                ),
                                design.hspacer(5),
                                Text(
                                  ids[index].subtitle,
                                  style: const TextStyle(
                                      fontSize: 7,
                                      fontWeight: FontWeight.w700,
                                      color: Color(0xff737373)),
                                )
                              ],
                            ),
                            const Spacer(),
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.arrow_forward_ios,
                                    size: 10))
                          ],
                        ),
                      ))),
          const Spacer(),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return const Idform();
              }));
            },
            child: Container(
              width: width,
              alignment: Alignment.center,
              height: 50,
              decoration: BoxDecoration(
                  color: design.shadeP,
                  borderRadius: BorderRadius.circular(10)),
              child: Text('Next',
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
