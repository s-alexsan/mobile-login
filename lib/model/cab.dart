class Cab {
  int? pk;
  String? carteiro;
  String? revestimento;
  String? metal;
  int? diametro;
  String? nf;
  String? data;
  String? insp;

  Cab(
      {this.pk,
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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['pk'] = pk;
    data['carteiro'] = carteiro;
    data['revestimento'] = revestimento;
    data['metal'] = metal;
    data['diametro'] = diametro;
    data['nf'] = nf;
    data['data'] = data;
    data['insp'] = insp;
    return data;
  }
}
