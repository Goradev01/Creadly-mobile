import 'package:flutter/material.dart';

class ErrorDisplay extends StatefulWidget {
  const ErrorDisplay({
    Key? key,
  }) : super(key: key);

  @override
  State<ErrorDisplay> createState() => _ErrorDisplayState();
}

class _ErrorDisplayState extends State<ErrorDisplay> {
  @override
  Widget build(BuildContext context) {
    var snackBar = const SnackBar(
      backgroundColor: Colors.white,
      content: Text(
        'Error in Connection',
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: 14.0, fontWeight: FontWeight.w500, color: Colors.black),
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
    return snackBar;
  }
}
