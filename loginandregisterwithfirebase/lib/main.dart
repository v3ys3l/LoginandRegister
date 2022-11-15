import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:loginandregisterwithfirebase/pages/auth/SingUp_Page.dart';
import 'package:loginandregisterwithfirebase/pages/auth/home_Page.dart';
import 'package:loginandregisterwithfirebase/pages/auth/login_Page.dart';
import 'pages/auth/login_Page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login and Register with Firebase',
      routes: {
        "/loginPage": (context)=> loginPage(),
        "/singUpPage": (context)=> SingUpPage(),
        "/homePage":(context)=>home_Page(),
      },
      home: loginPage(),
    );
  }
}
