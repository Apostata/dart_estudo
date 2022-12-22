// mixins permite implememar metodo e atributos de outra classe
// caso mais de um mixin tem um mesmo metodo o programa vai pegar o ultimo que foi passado

//Class abstrata
abstract class Cidadao {
  String nome;
  Cidadao(this.nome);

  void objetivosPessoais();
  void direitosEDeveres() {
    print('todos cidadão tem direitos e deveres');
  }
}

//interfaces
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

mixin Elegivel on Cidadao {
  bool elegivel = false;
  void prestacaoContas();
}

mixin Conta {
  late double _saldo = 0, salario = 33000;
  get saldo => _saldo;
  set depositar(double deposito) => _saldo += deposito;

  bool declaracaoRenda() {
    print('declaracao: ${_saldo / 12}, salario: $salario');
    return _saldo / 12 < salario;
  }

  void consutaSaldo() {
    print('Saldo é de: $_saldo');
  }
}

// classe comcre
class Candidato extends Cidadao
    with Elegivel, Conta
    implements Postagem, Presidenciavel {
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

  @override
  void prestacaoContas() {
    elegivel = declaracaoRenda();
    if (elegivel) {
      print('Candidato $nome é elegível');
    } else {
      print(
          'Candidato $nome está inelegível, renda declarada está incompatível');
    }
  }
}

void main(List<String> args) {
  var rene = Candidato('Rene', ideologia: 'Felicidade', partido: 'Da vida');
  rene
    ..objetivo = 'ser feliz'
    ..objetivosPessoais()
    ..post = 'Vou acabar com a tristeza!'
    ..escreverPostagem()
    ..ideologiaPolitica()
    ..consutaSaldo()
    ..consutaSaldo()
    // ..depositar = 396000
    ..depositar = 395999
    ..prestacaoContas();
}
