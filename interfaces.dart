/*
  Classes abstratas no dart, Servem de contrato para que uma classe siga alguma regra para sua implementação
*/

abstract class Cidadao {
  String nome;
  Cidadao(this.nome);

  void objetivosPessoais();
  void direitosEDeveres() {
    print('todos cidadão tem direitos e deveres');
  }
}

abstract class Presidenciavel {
  String ideologia;
  String partido;
  Presidenciavel(this.ideologia, this.partido);
  void ideologiaPolitica();
}

abstract class Postagem {
  late String post;

  void escreverPostagem();
}

class Candidato extends Cidadao implements Postagem, Presidenciavel {
  late String objetivo;

  @override
  late String post;
  late String partido;
  late String ideologia;

  Candidato(super.nome, {required this.ideologia, required this.partido});

  @override
  void objetivosPessoais() {
    print('$nome, tem o objetivo $objetivo');
  }

  @override
  void escreverPostagem() {
    print('Postagem de $nome, na rede social: $post');
  }

  @override
  void ideologiaPolitica() {
    print('$nome é candidato com ideologia $ideologia, pelo partido $partido');
  }
}

void main(List<String> args) {
  var rene = Candidato('Rene', ideologia: 'Felicidade', partido: 'Da vida');
  rene
    ..objetivo = 'ser feliz'
    ..objetivosPessoais()
    ..post = 'Vou acabar com a tristeza!'
    ..escreverPostagem()
    ..ideologiaPolitica();
}
