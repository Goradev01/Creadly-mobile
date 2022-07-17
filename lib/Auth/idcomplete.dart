import 'package:creadlymobile/style.dart';
import 'package:flutter/material.dart';

class Idcompleted extends StatefulWidget {
  const Idcompleted({Key? key}) : super(key: key);

  @override
  State<Idcompleted> createState() => _IdcompletedState();
}

class _IdcompletedState extends State<Idcompleted> {
  @override
  Widget build(BuildContext context) {
    final design = Ui();
    final width = MediaQuery.of(context).size.width;
    return design.layout(Padding(
      padding: const EdgeInsets.fromLTRB(25, 35, 25, 35),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
              design.title('Verification'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.all(3),
                    height: 22,
                    width: 22,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(11),
                        color: design.blue),
                    child: const Text(
                      '1',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  Text(
                    'Face scan',
                    style: TextStyle(
                        color: design.blue,
                        fontSize: 10,
                        fontWeight: FontWeight.w700),
                  )
                ],
              ),
              Container(
                alignment: Alignment.center,
                height: 5,
                margin: const EdgeInsets.all(3),
                width: 86,
                decoration: BoxDecoration(
                    // borderRadius: BorderRadius.circular(11),
                    color: design.shadeP),
              ),
              Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.all(3),
                    height: 22,
                    width: 22,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(11),
                        color: design.blue),
                    child: const Text(
                      '2',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  Text(
                    'Upload id',
                    style: TextStyle(
                        color: design.blue,
                        fontSize: 10,
                        fontWeight: FontWeight.w700),
                  )
                ],
              )
            ],
          ),
          Container(
              padding: const EdgeInsets.all(50),
              decoration: const BoxDecoration(
                  image: DecorationImage(
                image: AssetImage('assets/Star 14.png'),
              )),
              child: const Icon(Icons.check, color: Colors.white, size: 30)),
          SizedBox(
            width: width / 2,
            child: design.lineartext('ID upload completed'),
          ),
          GestureDetector(
              onTap: () {
                // Navigator.of(context).push(
                //   MaterialPageRoute(
                //     builder: (context) => const Pickid(),
                //   ),
                // );
              },
              child: design.longButton(width, 'Next'))
        ],
      ),
    ));
  }
}
