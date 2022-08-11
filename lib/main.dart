// ignore_for_file: use_build_context_synchronously

// import 'package:creadlymobile/Provider/data.dart';
import 'package:creadlymobile/Provider/categoryprovider.dart';
import 'package:creadlymobile/Provider/login.dart';
import 'package:creadlymobile/Provider/merchantprovider.dart';
import 'package:creadlymobile/Provider/signup.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'View/TabComponent/bottomnav.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<LoginProvider>(
        create: (_) => LoginProvider(),
      ),
      ChangeNotifierProvider<SignupProvider>(
        create: (_) => SignupProvider(),
      ),
      ChangeNotifierProvider<CategoryProvider>(
        create: (_) => CategoryProvider(),
      ),
      ChangeNotifierProvider<MerchantProvider>(
        create: (_) => MerchantProvider(),
      ),
    ],
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
    Provider.of<LoginProvider>(context, listen: false).updateAuth(auth);
  }

  @override
  void initState() {
    Provider.of<LoginProvider>(context, listen: false).checkfirsttimer();
    super.initState();
    getData();
  }

  Stream<Widget> loadingStream() async* {
    // await Future<void>.delayed(const Duration(seconds: 0));
    // yield const SplashScreen();
    await Future<void>.delayed(const Duration(seconds: 5));
    yield Consumer<LoginProvider>(builder: (context, data, child) {
      if (data.auth.isNotEmpty) {
        return const BottomNav();
      } else {
        return data.newuser;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Creadly',
      theme: ThemeData(
        fontFamily: 'Moderat',
        primarySwatch: Colors.blue,
      ),
      home: StreamBuilder<Widget>(
        // initialData: const SplashScreen(),
        stream: loadingStream(),
        builder: (context, snapshot) {
          return Scaffold(body: snapshot.data);
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
            alignment: Alignment.center,
            child: Image.asset('assets/splash.gif')),
        Align(
            alignment: Alignment.bottomLeft,
            child: Image.asset('assets/splash2.png')),
      ]),
    ));
  }
}
