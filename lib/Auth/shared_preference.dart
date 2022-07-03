// ignore_for_file: camel_case_types

import 'package:creadlymobile/Onboarding/welcome.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Onboarding/onboarding.dart';
 

class Shared_Preference extends StatefulWidget {
  const Shared_Preference({Key? key}) : super(key: key);

  @override
  State<Shared_Preference> createState() => _Shared_PreferenceState();
}

class _Shared_PreferenceState extends State<Shared_Preference> {
  bool firsttimer = false;

  void getData() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();

    setState(() {
      firsttimer = pref.getBool('firsttimer')!;
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    if (firsttimer == true) {
      return const Onboarding();
    } else {
      return const Welcome();
    }
  }
}
