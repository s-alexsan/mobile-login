import 'package:flutter/material.dart';

class Cab extends StatefulWidget {
  const Cab({Key? key}) : super(key: key);

  @override
  State<Cab> createState() => _CabState();
}

class _CabState extends State<Cab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Text("Cab"),
    );
  }
}
