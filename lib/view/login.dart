import 'package:app_login/model/login.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  ModelLogin objModel = ModelLogin();

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    objModel.validaUsuario();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: StreamBuilder<Object>(
        stream: objModel.stream,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData && snapshot.data) {
            return const Center(child: CircularProgressIndicator());
          } else {
            print(objModel.login);
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    buildTextFormField(
                      objModel.controller1,
                      hintText: 'Usuário',
                    ),
                    buildTextFormField(
                      objModel.controller2,
                      obscureText: true,
                      hintText: 'Senha',
                    ),
                    builTextButton(context)
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }

  Widget builTextButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            objModel.verificarUsuario().then((value) {
              switch (value) {
                case 1:
                  Navigator.pushReplacementNamed(context, '/management');
                  break;
                case 0:
                  SnackBar snackBar = SnackBar(
                    content: Text(objModel.msg),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  break;
                default:
              }
            });
          }
        },
        child: const Text('Acessar'),
      ),
    );
  }

  Widget buildTextFormField(TextEditingController controller,
      {bool obscureText = false, String hintText = ''}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
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
      ),
    );
  }
}
