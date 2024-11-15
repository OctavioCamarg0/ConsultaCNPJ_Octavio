class Empresa {
  String razaoSocial;
  String dataAbertura;
  String logradouro;
  String numero;
  String bairro;
  String cidade;
  String estado;
  String pais;
  String cep;
  // String telefones;
  // String emails;
  // String socios;
  // String atividades;
   
  Empresa(
      {required this.razaoSocial,
      required this.dataAbertura,
      required this.logradouro,
      required this.numero,
      required this.bairro,
      required this.cidade,
      required this.estado,
      required this.pais,
      required this.cep,
      // required this.telefones,
      // required this.emails,
      // required this.socios,
      // required this.atividades
      });

  // Método para converter um objeto Usuario em um mapa
  Map<String, dynamic> paraJson() {
    return {
      'razaoSocial': razaoSocial,
      'dataAbertura': dataAbertura,
      'logradouro': logradouro,
      'numero': numero,
      'bairro': bairro,
      'cidade': cidade,
      'estado': estado,
      'pais': pais,
      'cep': cep,
      // 'telefones': telefones,
      // 'emails': emails,
      // 'socios': socios,
      // 'atividades': atividades
    };
  }

  // Método para criar um objeto Usuario a partir de um mapa
  factory Empresa.deJson(Map<String, dynamic> json) {
    return Empresa(
        razaoSocial: json['alias'],
        dataAbertura: json['founded'],
        logradouro: json['address']['street'],
        numero: json['address']['number'],
        bairro: json['address']['district'],
        cidade: json['address']['city'],
        estado: json['address']['state'],
        pais: json['address']['country']['name'],
        cep: json['address']['zip'],
        // telefones: json['phones'],
        // emails: json['e-mails'],
        // socios: json['company'],
        // atividades: json['sideActivies']
     );
  }
}