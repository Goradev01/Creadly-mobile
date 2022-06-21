import 'package:flutter/material.dart';

class Ui {
  final shadeP = const Color(0xffEDE9F7);
  final blue = const Color(0xff3A0CA3);
  final ash = const Color(0xff2E2E2E);
  final pink = const Color(0xffB5179E);
  final productblack = const Color(0xff1A0404);

  final Shader linearGradient = const LinearGradient(
    colors: <Color>[Color(0xffB5179E), Color(0xff3A0CA3)],
  ).createShader(const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

  lineartext(text) {
    return Text(
      text,
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

  ptext(text) {
    return Text(
      text,
      style: const TextStyle(
          fontSize: 14.0,
          fontWeight: FontWeight.w700,
          color: Color(0xff2E2E2E)),
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

  smalltext(text) {
    return Text(
      text,
      style: TextStyle(color: ash, fontSize: 10, fontWeight: FontWeight.w400),
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
