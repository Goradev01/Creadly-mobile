import 'package:creadlymobile/style.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Auth/shared_preference.dart';
import 'TabComponent/bottomnav.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String auth = '';
  void getData() async {
    final SharedPreferences token = await SharedPreferences.getInstance();

    setState(() {
      auth = token.getString('AuthToken')!;
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  Stream<Widget> loadingStream() async* {
    await Future<void>.delayed(const Duration(seconds: 0));
    yield const SplashScreen();
    await Future<void>.delayed(const Duration(seconds: 3));
    yield auth.isNotEmpty ? const Shared_Preference() : const BottomNav();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final design = Ui();
    return MaterialApp(
      title: 'Creadly',
      theme: ThemeData(
        fontFamily: 'Moderat',
        primarySwatch: Colors.blue,
      ),
      home: StreamBuilder(
        initialData: const SplashScreen(),
        stream: loadingStream(),
        builder: (context, snapshot) {
          return design.layout(snapshot.data);
        },
      ),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Align(
            alignment: Alignment.topRight,
            child: Image.asset('assets/splash1.png')),
        Align(
            alignment: Alignment.center, child: Image.asset('assets/logo.png')),
        Align(
            alignment: Alignment.bottomLeft,
            child: Image.asset('assets/splash2.png')),
      ]),
    ));
  }
}
