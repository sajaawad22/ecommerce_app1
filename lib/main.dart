import 'package:ecommerce_app1/cartpage.dart';
import 'package:ecommerce_app1/cratmodel.dart';
import 'package:ecommerce_app1/registeration.dart';
import 'package:ecommerce_app1/storepage.dart';
import'package:flutter/material.dart';
import 'dart:async';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    ChangeNotifierProvider(
      create: (context) => CartModel(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      routes: {
        '/registeration': (context) => const registeration(),
        '/storepage': (context) => StorePage(),
        '/cart': (context) => CartPage()
      },
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
            () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) =>registeration()))
    );
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Image.network('https://img.freepik.com/free-vector/supermarket-logo-concept_23-2148467758.jpg?w=826&t=st=1682449254~exp=1682449854~hmac=534244ca049c7d274ff6c0fb0b5ffb07a588fe2c25ff164ade99e0e5f80c6ce8'),
    );
  }
}