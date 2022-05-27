import 'package:app_login/model/loading.dart';
import 'package:flutter/cupertino.dart';

import 'globals.dart';

class Cab extends Loading {
  String table = "CAB";
  int pk = 0;
  String? carteiro;
  String? revestimento;
  String? metal;
  int? diametro;
  String? nf;
  String? data;
  String? insp;

  List<Map<String, dynamic>> listController = [];

  Cab(
      {this.pk = 0,
      this.carteiro,
      this.revestimento,
      this.metal,
      this.diametro,
      this.nf,
      this.data,
      this.insp});

  Cab.fromJson(Map<String, dynamic> json) {
    pk = json['pk'];
    carteiro = json['carteiro'];
    revestimento = json['revestimento'];
    metal = json['metal'];
    diametro = json['diametro'];
    nf = json['nf'];
    data = json['data'];
    insp = json['insp'];
  }

  Future<void> newCab() async {
    change();
    toJson().forEach((key, value) {
      Map<String, dynamic> valueIndex = {};
      valueIndex.addAll(getValues(key));
      listController.add(valueIndex);
    });
    change();
  }

  Future<void> oldCab(int pk) async {
    change();
    List<Map<String, dynamic>> list = await objCRUD.read(
      table,
      where: 'PK = ?',
      whereArgs: [pk.toString()],
    );

    list.first.forEach((key, value) {
      Map<String, dynamic> valueIndex = {};

      if (key == 'PK') {
        this.pk = value as int;
      }

      valueIndex.addAll(getValues(key));
      valueIndex['CONTROLLER'] = TextEditingController(text: value.toString());
      listController.add(valueIndex);
    });
    change();
  }

  Map<String, dynamic> toJson({bool firstInit = true}) {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (firstInit) {
      data['PK'] = pk;
      data['CARTEIRO'] = carteiro;
      data['REVESTIMENTO'] = revestimento;
      data['METAL'] = metal;
      data['DIAMETRO'] = diametro;
      data['NF'] = nf;
      data['DATA'] = data;
      data['INSP'] = insp;
    } else {
      data['CARTEIRO'] = listController[1]['CONTROLLER'].text;
      data['REVESTIMENTO'] = listController[2]['CONTROLLER'].text;
      data['METAL'] = listController[3]['CONTROLLER'].text;
      data['DIAMETRO'] = int.parse(listController[4]['CONTROLLER'].text);
      data['NF'] = listController[5]['CONTROLLER'].text;
      data['DATA'] = listController[6]['CONTROLLER'].text;
      data['INSP'] = listController[7]['CONTROLLER'].text;
    }
    return data;
  }

  Future<int> cabIU() async {
    int result = 0;
    try {
      change();
      result = await objCRUD.iu(table, pk, toJson(firstInit: false));
      pk = result;
      print('result: ${result}');
      msg = 'Salvo com sucesso';
      change();
      return result;
    } catch (e) {
      msg = 'Erro ao salvar';
      return result;
    }
  }

  Map<String, dynamic> getValues(String key) {
    Map<String, dynamic> result = {};
    result['CONTROLLER'] = TextEditingController();
    switch (key) {
      case 'PK':
        result['LABEL'] = 'PK';
        result['SHOW_FORM'] = null;
        result['INPUT_FORM'] = TextInputType.number;
        break;
      case 'CARTEIRO':
        result['LABEL'] = 'Carteiro';
        result['SHOW_FORM'] = 1;
        result['INPUT_FORM'] = TextInputType.text;
        break;
      case 'REVESTIMENTO':
        result['LABEL'] = 'Revestimento';
        result['SHOW_FORM'] = 1;
        result['INPUT_FORM'] = TextInputType.text;
        break;
      case 'METAL':
        result['LABEL'] = 'Metal';
        result['SHOW_FORM'] = 1;
        result['INPUT_FORM'] = TextInputType.text;
        break;
      case 'DIAMETRO':
        result['LABEL'] = 'Diametro';
        result['SHOW_FORM'] = 1;
        result['INPUT_FORM'] = TextInputType.number;
        break;
      case 'NF':
        result['LABEL'] = 'NFc';
        result['SHOW_FORM'] = 1;
        result['INPUT_FORM'] = TextInputType.text;
        break;
      case 'DATA':
        result['LABEL'] = 'Data';
        result['SHOW_FORM'] = 1;
        result['INPUT_FORM'] = TextInputType.text;
        break;
      case 'INSP':
        result['LABEL'] = 'Instrumento';
        result['SHOW_FORM'] = 1;
        result['INPUT_FORM'] = TextInputType.text;
        break;
      default:
    }
    return result;
  }
}
