// VIA CEP api = viacep.com.br/ws/{cep}/json/
import 'dart:convert';

import 'package:http/http.dart' as http;

void main(List<String> args) async {
  String url = 'https://viacep.com.br/ws/13348883/json/';

  try {
    var response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      //decode
      Map<String, dynamic> parsedJson = jsonDecode(response.body);
      CEP cep = CEP.fromJson(parsedJson);
      print(cep);

      //encode
      Map<String, dynamic> mapJson = cep.toJson();
      String encodedJson = jsonEncode(mapJson);
      print(encodedJson);
    } else {
      throw Exception(
          'Erro ao obter o cep\n Status Code: ${response.statusCode}');
    }
  } catch (e) {
    print(e);
  }
}

class CEP {
  String cep;
  String logradouro;
  String complemento;
  String bairro;
  String uf;
  String ibge;
  String gia;
  String ddd;
  String siafi;

  CEP({
    required this.cep,
    required this.logradouro,
    required this.complemento,
    required this.bairro,
    required this.uf,
    required this.ibge,
    required this.gia,
    required this.ddd,
    required this.siafi,
  });

  CEP.fromJson(Map<String, dynamic> json)
      : this(
          cep: json['cep'],
          logradouro: json['logradouro'],
          complemento: json['complemento'],
          bairro: json['bairro'],
          uf: json['uf'],
          ibge: json['ibge'],
          gia: json['gia'],
          ddd: json['ddd'],
          siafi: json['siafi'],
        );

  Map<String, dynamic> toJson() {
    return {
      'cep': cep,
      'logradouro': logradouro,
      'complemento': complemento,
      'bairro': bairro,
      'uf': uf,
      'ibge': ibge,
      'gia': gia,
      'ddd': ddd,
      'siafi': siafi,
    };
  }

  @override
  String toString() {
    return 'Instance of CEP: {'
        '"cep": $cep,'
        '"logradouro": $logradouro,'
        '"complemento": $complemento,'
        '"bairro": $bairro,'
        ' "uf": $uf,'
        ' "ibge": $ibge,'
        '"gia": $gia,'
        '"ddd": $ddd,'
        '"siafi": $siafi,'
        '}';
  }
}
