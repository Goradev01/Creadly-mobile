// ignore_for_file: use_build_context_synchronously

import 'package:creadlymobile/Statemangement/data.dart';
import 'package:creadlymobile/TabComponent/bottomnav.dart';
import 'package:creadlymobile/style.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(ChangeNotifierProvider<DataManagement>(
    create: (_) => DataManagement(),
    child: const MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // late Widget auth;

  void getData() async {
    final SharedPreferences token = await SharedPreferences.getInstance();
    String auth = token.getString('AuthToken')!;
    Provider.of<DataManagement>(context, listen: false).updateAuth(auth);
  }

  @override
  void initState() {
    super.initState();

    getData();
    Provider.of<DataManagement>(context, listen: false).checkfirsttimer();
  }

  Stream<Widget> loadingStream() async* {
    await Future<void>.delayed(const Duration(seconds: 0));
    yield const SplashScreen();
    await Future<void>.delayed(const Duration(seconds: 3));

    yield Consumer<DataManagement>(builder: (context, data, child) {
      if (data.auth.isNotEmpty) {
        return const BottomNav();
      } else {
        return data.newuser;
      }
    });
  }

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
