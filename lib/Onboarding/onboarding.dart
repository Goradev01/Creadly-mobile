import 'package:creadlymobile/Onboarding/welcome.dart';
import 'package:creadlymobile/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({Key? key}) : super(key: key);

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class Onboarddata {
  final String title;
  final int id;
  final String subtitle;
  final String imageurl;
  Onboarddata({
    required this.title,
    required this.id,
    required this.subtitle,
    required this.imageurl,
  });
}

class _OnboardingState extends State<Onboarding> {
  int onboardNo = 0;

  PageController controller = PageController();
  List<Onboarddata> onboard = [
    Onboarddata(
        title: 'Get Salary Advance',
        id: 0,
        subtitle:
            'this dummy text should contain information that further explains the main header.',
        imageurl: 'onboard1'),
    Onboarddata(
        title: 'Buy anything you want',
        id: 1,
        subtitle:
            'this dummy text should contain information that further explains the main header.',
        imageurl: 'onboarding2'),
    Onboarddata(
        title: 'Great Interest rates',
        id: 2,
        subtitle:
            'this dummy text should contain information that further explains the main header.',
        imageurl: 'onboarding3')
  ];
  @override
  Widget build(BuildContext context) {
    final design = Ui();
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    Future<void> setData(data) async {
      final SharedPreferences pref = await SharedPreferences.getInstance();
      pref.setBool('firsttimer', data);
    }

    return design.layout(Padding(
      padding: const EdgeInsets.fromLTRB(25, 70, 25, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
              height: height - 200,
              child: PageView.builder(
                  controller: controller,
                  onPageChanged: (int value) {
                    setState(() {
                      onboardNo = value;
                    });
                  },
                  itemCount: onboard.length,
                  itemBuilder: (BuildContext context, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                            width: width,
                            child: design.lineartext(onboard[index].title)),
                        const SizedBox(
                          height: 30,
                        ),
                        design.ptext(onboard[index].subtitle),
                        const SizedBox(
                          height: 50,
                        ),
                        Center(
                            child: IconGradient(
                          child: SvgPicture.asset(
                            'assets/${onboard[index].imageurl}.svg',
                            color: Colors.white,
                            // width: 340,
                            // height: 310,
                            fit: BoxFit.cover,
                          ),
                        ))
                      ],
                    );
                  })),
          InkWell(
            onTap: () {
              setData(false);
              if (onboardNo < 2) {
                controller.animateToPage(
                  onboardNo + 1,
                  duration: const Duration(milliseconds: 400),
                  curve: Curves.easeInOut,
                );
              } else {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return const Welcome();
                }));
              }
            },
            child: Container(
              width: width,
              alignment: Alignment.center,
              height: 50,
              decoration: BoxDecoration(
                  color: design.shadeP,
                  borderRadius: BorderRadius.circular(10)),
              child: const Text(
                'Next',
                style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff3A0CA3)),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                  onboard.length,
                  (index) => Center(
                        child: Container(
                            alignment: Alignment.center,
                            width: onboard[index].id == onboardNo ? 20 : 10,
                            height: 10,
                            margin: const EdgeInsets.all(2),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: onboard[index].id == onboardNo
                                    ? const Color(0xff3A0CA3)
                                    : const Color(0xfff4f4f4))),
                      )),
            ),
          ),
        ],
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
        colors: <Color>[Color(0xffB5179E), Color(0xff3A0CA3)],
        tileMode: TileMode.mirror,
      ).createShader(bounds),
      child: child,
    );
  }
}
