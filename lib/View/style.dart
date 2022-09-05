import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class Ui {
  final blue = const Color(0xff3A0CA3);
  final numb = const Color(0xffA9A9BC);
  final shadeP = const Color(0xffEDE9F7);
  final shadePi = const Color(0xffF8EAF6);
  final lightgrey = const Color(0xffF8F8FA);

  final ash = const Color(0xff2E2E2E);
  final pink = const Color(0xffB5179E);

  final darkPurple = const Color(0xff0D0520);
  final productblack = const Color(0xff1A0404);
  final shadenew = const Color(0xffFFE9E9);
  final Shader linearGradient = const LinearGradient(
    colors: <Color>[Color(0xffB5179E), Color(0xff3A0CA3)],
  ).createShader(const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

  Widget lineartext(text) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
          fontSize: 32.0,
          fontWeight: FontWeight.w500,
          foreground: Paint()..shader = linearGradient),
    );
  }

  Future nav(BuildContext context, Widget widget) {
    return Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return widget;
    }));
  }

  Widget smallineartext(text, double size) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
          fontSize: size,
          fontWeight: FontWeight.w500,
          foreground: Paint()..shader = linearGradient),
    );
  }

  Widget naira(color, size) {
    return Text('N',
        style: TextStyle(
            fontSize: size,
            color: color,
            decorationStyle: TextDecorationStyle.double,
            decorationColor: color,
            decoration: TextDecoration.lineThrough));
  }

  Widget amount(color, double size, text, weight) {
    return Row(
      children: [
        Text('N',
            style: TextStyle(
                fontSize: size,
                color: color,
                decorationStyle: TextDecorationStyle.double,
                decorationColor: color,
                decoration: TextDecoration.lineThrough)),
        Text(text,
            style: TextStyle(
              fontSize: size,
              color: color,
              fontWeight: weight,
              decorationColor: color,
            ))
      ],
    );
  }

  Widget input(color, double size, text, weight) {
    return Text(text,
        style: TextStyle(
          fontSize: size,
          color: color,
          fontWeight: weight,
          decorationColor: color,
        ));
  }

  Widget ptext(text) {
    return Text(
      text,
      style: const TextStyle(
          fontSize: 14.0,
          fontWeight: FontWeight.w700,
          color: Color(0xff2E2E2E)),
    );
  }

  Widget backnav(context, text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
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
                  color: blue,
                )),
          ),
          wspacer(19),
          title(text),
        ],
      ),
    );
  }

  Widget title(text) {
    return Text(
      text,
      style: TextStyle(
          fontSize: 20.0, fontWeight: FontWeight.w500, color: productblack),
    );
  }

  Widget smalltext(text) {
    return Text(
      text,
      style: TextStyle(color: ash, fontSize: 10, fontWeight: FontWeight.w400),
    );
  }

  Widget layout(widgets) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: const Color(0xffffffff),
        body: SafeArea(
          child: widgets,
        ));
  }

  Widget stackpage(void nav, text) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            nav;
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
                color: blue,
              )),
        ),
        wspacer(19),
        title(text),
      ],
    );
  }

  Widget shimmerProduct(
    int num,
  ) {
    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 2,
      childAspectRatio: 1.1,
      crossAxisSpacing: 15.0,
      mainAxisSpacing: 10.0,
      physics: const ScrollPhysics(),
      children: List.generate(
        num,
        (index) => Shimmer.fromColors(
            baseColor: const Color(0xFFEBEBF4),
            highlightColor: const Color(0xFFEBEBF4).withOpacity(0.1),
            // loop: 5,
            enabled: true,
            // period: const Duration(milliseconds: 1500),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xffFfFfFf),
                borderRadius: BorderRadius.circular(10),
              ),
            )),
      ),
    );
  }

  Widget loadingProgress() {
    return Center(
        child: CircularProgressIndicator(
      backgroundColor: Colors.white,
      color: blue,
    ));
  }

  Widget hspacer(double num) {
    return SizedBox(height: num);
  }

  Widget wspacer(double num) {
    return SizedBox(width: num);
  }

  Widget longButton(double width, text) {
    return Container(
      width: width,
      alignment: Alignment.center,
      height: 50,
      decoration:
          BoxDecoration(color: blue, borderRadius: BorderRadius.circular(10)),
      child: Text(text,
          style: const TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w500,
              color: Colors.white)),
    );
  }

  Widget linearGButton(width, text) {
    return Container(
      width: width,
      alignment: Alignment.center,
      height: 50,
      decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: <Color>[Color(0xffB5179E), Color(0xff3A0CA3)],
          ),
          borderRadius: BorderRadius.circular(10)),
      child: Text(text,
          style: const TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w500,
              color: Colors.white)),
    );
  }

  Widget smallText(text) {
    return Text(
      text,
      style: const TextStyle(
          color: Color(0xff8e8e8e), fontSize: 10, fontWeight: FontWeight.w400),
    );
  }

  Widget longoutlineButton(double width, text) {
    return Container(
      width: width,
      alignment: Alignment.center,
      height: 50,
      decoration: BoxDecoration(
          border: Border.all(color: blue, width: 1.5),
          borderRadius: const BorderRadius.all(Radius.circular(10))),
      child: Text(
        text,
        style:
            TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500, color: blue),
      ),
    );
  }
}
