// Factory sempre retorna uma instancia pré-definida, a sintaxe é a mesma da criação de uma nova instancia, é como se delegasse sua instancia para o Pessoa._construtor neste caso

import 'dart:math';

void main(List<String> args) {
  // Pessoa p1 = Pessoa();
  // Pessoa p2 = Pessoa();

  // print(p1.nome);
  // print(p2.nome);

  PessoaInstancia p3 = new PessoaInstancia(nome: 'Rene');
  print('nome:${p3.nome}, identidade:${p3._identidade}');
  PessoaInstancia p4 = PessoaInstancia();
  print('nome:${p4.nome}, identidade:${p4._identidade}');
}

class Pessoa {
  static final _singleton = Pessoa._constructor('indefinido');
  String nome;

  Pessoa._constructor(this.nome);
  factory Pessoa() => _singleton;
}

class PessoaInstancia {
  static PessoaInstancia? _instancia;
  String nome;
  final int _identidade;

  PessoaInstancia._constructor(this.nome, this._identidade);

  factory PessoaInstancia({String nome = 'indefinido', int? identidade}) {
    identidade = identidade == null ? Random().nextInt(99999999 + 1) : 1;
    // _instancia = _instancia ?? PessoaInstancia._constructor(nome, identidade);
    // return _instancia!;
    // ou
    return _instancia ??= PessoaInstancia._constructor(nome, identidade);
  }
}
