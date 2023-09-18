import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_auth/screens/home_page.dart';
import 'package:google_auth/controller/main_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  SharedPreferences pref = await SharedPreferences.getInstance();
  bool isShowHome = pref.getBool('showHome') ?? false;

  runApp(MyApp(
    isShowHome: isShowHome,
  ));
}

class MyApp extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  var isShowHome;

  MyApp({super.key, required this.isShowHome});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        useMaterial3: true,
      ),
      home: isShowHome ? const HomePage() : const MainPage(),
    );
  }
}
