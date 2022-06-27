import 'package:flutter/material.dart';

class Ui {
  final blue = const Color(0xff3A0CA3);
  final numb = const Color(0xffA9A9BC);
  final shadeP = const Color(0xffEDE9F7);
  final shadePi = const Color(0xffF8EAF6);
  final ash = const Color(0xff2E2E2E);
  final pink = const Color(0xffB5179E);
  final darkPurple = const Color(0xff0D0520);
  final productblack = const Color(0xff1A0404);

  final Shader linearGradient = const LinearGradient(
    colors: <Color>[Color(0xffB5179E), Color(0xff3A0CA3)],
  ).createShader(const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

  lineartext(text) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
          fontSize: 32.0,
          fontWeight: FontWeight.w500,
          foreground: Paint()..shader = linearGradient),
    );
  }

  naira(color, size) {
    return Text('N',
        style: TextStyle(
            fontSize: size,
            color: color,
            decorationStyle: TextDecorationStyle.double,
            decorationColor: color,
            decoration: TextDecoration.lineThrough));
  }

  amount(color, size, text, weight) {
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

  ptext(text) {
    return Text(
      text,
      style: const TextStyle(
          fontSize: 14.0,
          fontWeight: FontWeight.w700,
          color: Color(0xff2E2E2E)),
    );
  }

  title(text) {
    return Text(
      text,
      style: TextStyle(
          fontSize: 20.0, fontWeight: FontWeight.w500, color: productblack),
    );
  }

  smalltext(text) {
    return Text(
      text,
      style: TextStyle(color: ash, fontSize: 10, fontWeight: FontWeight.w400),
    );
  }

  layout(widgets) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: const Color(0xffffffff),
        body: SafeArea(
          child: widgets,
        ));
  }

  stackpage(void nav, text) {
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

  hspacer(double num) {
    return SizedBox(height: num);
  }

  wspacer(double num) {
    return SizedBox(width: num);
  }

  longButton(width, text) {
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

  linearGButton(width, text) {
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

  longoutlineButton(width, text) {
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
