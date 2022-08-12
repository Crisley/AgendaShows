class Show {
  String? id;
  DateTime? dataHora;
  int? cache;
  Contratante? contratante;

  Show({this.id, this.dataHora, this.cache, this.contratante});

  Show.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    dataHora = DateTime.tryParse(json['dataHora']);
    cache = json['cache'];
    contratante = json['contratante'] != null
        ? Contratante.fromJson(json['contratante'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['dataHora'] = dataHora;
    data['cache'] = cache;
    if (contratante != null) {
      data['contratante'] = contratante!.toJson();
    }
    return data;
  }
}

class Contratante {
  String? id;
  String? nome;
  String? logradouro;
  int? numero;
  String? bairro;
  String? cidade;

  Contratante(
      {this.id,
      this.nome,
      this.logradouro,
      this.numero,
      this.bairro,
      this.cidade});

  Contratante.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nome = json['nome'];
    logradouro = json['logradouro'];
    numero = json['numero'];
    bairro = json['bairro'];
    cidade = json['cidade'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['nome'] = nome;
    data['logradouro'] = logradouro;
    data['numero'] = numero;
    data['bairro'] = bairro;
    data['cidade'] = cidade;
    return data;
  }
}
