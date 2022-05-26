import 'package:flutter/material.dart';

class BuildForm extends StatefulWidget {
  final TextEditingController controller;
  final bool obscureText;
  final String? hintText;

  const BuildForm(this.controller, {this.obscureText = false, this.hintText, Key? key})
      : super(key: key);

  @override
  State<BuildForm> createState() => _BuildFormState();
}

class _BuildFormState extends State<BuildForm> {
  late TextEditingController controller;
  bool obscureText = false;
  String? hintText;

  @override
  void initState() {
    controller = widget.controller;
    obscureText = widget.obscureText;
    hintText = widget.hintText;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        hintText: hintText,
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Campo obrigatório';
        }
        return null;
      },
    );
  }
}
