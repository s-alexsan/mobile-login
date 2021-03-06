// ignore_for_file: file_names

import 'dart:async';
import 'dart:math';

import 'package:app_login/model/globals.dart';
import 'package:app_login/model/loading.dart';
import 'package:flutter/material.dart';

class ModelLogin extends Loading {
  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  String msg = "";
  bool login = false;

  ModelLogin();

  Stream<bool> validaUsuario(context) async* {
    change();
    yield loading;
    List<Map<String, dynamic>> readData = await objCRUD.read('AUT_USUARIO');
    if (readData.isNotEmpty) {
      Navigator.pushReplacementNamed(context, '/management');
    } else {
      change();
      yield loading;
    }
  }

  // Função que verifica o login do usuário
  Future<int> verificarUsuario() async {
    change();
    int result = 0;
    try {
      await objCRUD.insert('AUT_USUARIO', toJson());
      await objCRUD.read('AUT_USUARIO');

      result = 1;
      change();
      return result;
    } catch (e) {
      change();
      msg = "Erro ao processar";
      return result;
    }
  }

  ModelLogin.fromJson(Map<String, dynamic> json) {
    controller1 = json['controller1'];
    controller2 = json['controller2'];
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = <String, dynamic>{};
    data['USERNAME'] = controller1.text;
    data['PASSWORD'] = controller2.text;
    return data;
  }
}
