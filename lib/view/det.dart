import 'package:flutter/material.dart';

class Det extends StatefulWidget {
  const Det({Key? key}) : super(key: key);

  @override
  State<Det> createState() => _DetState();
}

class _DetState extends State<Det> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Text("Det"),
    );
  }
}
