class Det {
  int? pk;
  int? pkCab;
  String? numero;
  double? comprimento;
  String? heat;
  String? ap;
  double? peso;
  double? espessura;
  int? camada;

  Det(
      {this.pk,
      this.pkCab,
      this.numero,
      this.comprimento,
      this.heat,
      this.ap,
      this.peso,
      this.espessura,
      this.camada});

  Det.fromJson(Map<String, dynamic> json) {
    pk = json['pk'];
    pkCab = json['pkCab'];
    numero = json['numero'];
    comprimento = json['comprimento'];
    heat = json['heat'];
    ap = json['ap'];
    peso = json['peso'];
    espessura = json['espessura'];
    camada = json['camada'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['pk'] = pk;
    data['pkCab'] = pkCab;
    data['numero'] = numero;
    data['comprimento'] = comprimento;
    data['heat'] = heat;
    data['ap'] = ap;
    data['peso'] = peso;
    data['espessura'] = espessura;
    data['camada'] = camada;
    return data;
  }
}
