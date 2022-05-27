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

  Map<String, dynamic> toJson({bool firstInit = true}) {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (firstInit) {
      data['PK'] = pk;
      data['CARTEIRO'] = carteiro;
      data['REVESTIMENTO'] = revestimento;
      data['DIAMETRO'] = diametro;
      data['NF'] = nf;
      data['DATA'] = data;
      data['INSP'] = insp;
    } else {
      data['CARTEIRO'] = listController[3]['CONTROLLER'].text;
      data['REVESTIMENTO'] = listController[3]['CONTROLLER'].text;
      data['METAL'] = listController[3]['CONTROLLER'].text;
      data['DIAMETRO'] = listController[3]['CONTROLLER'].text;
      data['NF'] = listController[5]['CONTROLLER'].text;
      data['DATA'] = listController[6]['CONTROLLER'].text;
      data['INSP'] = listController[7]['CONTROLLER'].text;
    }
    return data;
  }

  void listToCrud() {
    toJson().forEach((key, value) {
      Map<String, dynamic> valueIndex = {};
      valueIndex.addAll(getValues(key));
      listController.add(valueIndex);
    });
  }

  Future<int> cabIU() async {
    int result = 0;
    change();
    result = await objCRUD.iu(table, pk, toJson(firstInit: false));
    change();
    return result;
  }

  Map<String, dynamic> getValues(String key) {
    Map<String, dynamic> result = {};
    result['CONTROLLER'] = TextEditingController();
    switch (key) {
      case 'PK':
        result['LABEL'] = 'PK';
        result['SHOW_FORM'] = null;
        break;
      case 'CARTEIRO':
        result['LABEL'] = 'Carteiro';
        result['SHOW_FORM'] = 1;
        break;
      case 'REVESTIMENTO':
        result['LABEL'] = 'Revestimento';
        result['SHOW_FORM'] = 1;
        break;
      case 'METAL':
        result['LABEL'] = 'Metal';
        result['SHOW_FORM'] = 1;
        break;
      case 'DIAMETRO':
        result['LABEL'] = 'Diametro';
        result['SHOW_FORM'] = 1;
        break;
      case 'NF':
        result['LABEL'] = 'NFc';
        result['SHOW_FORM'] = 1;
        break;
      case 'DATA':
        result['LABEL'] = 'Data';
        result['SHOW_FORM'] = 1;
        break;
      case 'INSP':
        result['LABEL'] = 'Instrumento';
        result['SHOW_FORM'] = 1;
        break;
      default:
    }
    return result;
  }
}
