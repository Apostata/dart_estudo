// retorna um attibuto _singleton da classe privada Pessoa, com uma instancia estática
void main(List<String> args) {
  Pessoa p1 = Pessoa._singleton;
  Pessoa p2 = Pessoa._singleton;
  p2.nome = 'get singleton';

  print(p1.nome);
  print(p2.nome);
}

class Pessoa {
  String? nome;
  static final _singleton = Pessoa._constructor();

  Pessoa._constructor();

  static get singleton {
    return _singleton;
  }
}
