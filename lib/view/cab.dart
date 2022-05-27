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
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () => Navigator.of(context).pushNamed('/cabDet'),
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () => Navigator.pushNamed(context, '/det'),
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Center(
                child: Text("Det"),
              ),
            ),
          )
        ],
      ),
    );
  }
}
