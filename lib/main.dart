import 'package:app_login/view/cab.dart';
import 'package:app_login/view/login.dart';
import 'package:app_login/view/management.dart';
import 'package:flutter/material.dart';

import 'model/globals.dart';

void main() async {
  await objCRUD.connect();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Webdutos',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const Login(),
        '/management': (context) => const Management(),
        '/cab': (context) => const Cab(),
      },
    );
  }
}
