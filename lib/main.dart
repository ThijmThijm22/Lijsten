import 'package:flutter/material.dart';

// Pages
import 'package:groceries/pages/home.dart';
import 'package:groceries/pages/new_list.dart';
import 'package:groceries/pages/login.dart';

// Firebase
import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_auth/firebase_auth.dart';


Future <void> main() async {
  WidgetsFlutterBinding();
  await Firebase.initializeApp();

  runApp(MaterialApp (
  debugShowCheckedModeBanner: false,

  theme: ThemeData(
    primarySwatch: Colors.green,
  ),



  initialRoute: '/login',
  routes: {
    '/login': (context) => Login(),
    '/home': (context) => Home(),
    '/new_list': (context) => NewList(),
  }
));
}