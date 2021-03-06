import 'package:app_login/model/globals.dart';
import 'package:flutter/material.dart';

class Management extends StatefulWidget {
  const Management({Key? key}) : super(key: key);

  @override
  State<Management> createState() => MmanagementState();
}

class MmanagementState extends State<Management> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () => {
                objCRUD
                    .delete('AUT_USUARIO')
                    .then((value) => Navigator.of(context).pushReplacementNamed('/'))
              },
              icon: const Icon(Icons.exit_to_app),
            )
          ],
        ),
        body: Column(
          children: [
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/cab'),
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Center(
                  child: Text("Cab"),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
