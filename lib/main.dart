import 'package:creadlymobile/Onboarding/onboarding.dart';
import 'package:creadlymobile/style.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  Stream<Widget> loadingStream() async* {
    await Future<void>.delayed(const Duration(seconds: 0));
    yield const SplashScreen();
    await Future<void>.delayed(const Duration(seconds: 3));
    yield const Onboarding();
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
