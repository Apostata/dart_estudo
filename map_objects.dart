class Carro {
  String marca, modelo;
  Carro(this.marca, this.modelo);
}

class Pessoa {
  //singleton
  static final Map<String, Pessoa> _pessoas = Map();
  final String nome;
  int idade;
  double peso;

  Pessoa._singleton(this.nome, this.idade, this.peso);

  factory Pessoa(String nome, {int idade = 1, double peso = 1}) {
    if (_pessoas.containsKey(nome)) {
      return _pessoas[nome]!;
    }
    final novaPessoa = Pessoa._singleton(nome, idade, peso);
    _pessoas[nome] = novaPessoa;
    return novaPessoa;
  }

  static void mostrarDetalhes(String nome) {
    if (_pessoas.containsKey(nome)) {
      return print(
          'Details - nome:$nome, idade:${_pessoas[nome]!.idade}, peso:${_pessoas[nome]!.peso}');
    }
    return print('pessoa não encontrada!');
  }

  static void alterarDetalhes(String nome, {int idade = 1, double peso = 1}) {
    if (_pessoas.containsKey(nome)) {
      _pessoas[nome]
        ?..idade = idade
        ..peso = peso;
      return print(
          'Alterado - nome:$nome, idade:${_pessoas[nome]!.idade}, peso:${_pessoas[nome]!.peso}');
    }
  }

  static void mostrarPessoas() {
    print('pessoas: $_pessoas');
    _pessoas.forEach((key, value) {
      print('foreach: $key - ${value.nome} ${value.idade} ${value.peso}');
    });
  }

  @override
  String toString() {
    return 'Pessoa $nome $idade';
  }
}

void main(List<String> args) {
  Carro carro1 = Carro('Honda', 'Civic');
  Carro carro2 = Carro('Toyota', 'Yaris');
  Carro carro3 = Carro('Fiat', 'Palio');

  Map<String, Carro> carros = {'0': carro1, '1': carro2};
  carros['2'] = carro3;

  for (int i = 0; i < carros.length; i++) {
    print(carros['$i']?.modelo);
  }

  for (String key in carros.keys) {
    final carro = carros[key];
    print('forin: $key ${carro?.modelo}');
  }

  carros.forEach((key, value) {
    print('foreach: $key, ${value.modelo}');
  });

  Pessoa p1 = Pessoa('Rene', idade: 34, peso: 65);
  Pessoa p2 = Pessoa('Erica', idade: 30, peso: 45);

  Pessoa('Rene', idade: 65);
  Pessoa('Erica', peso: 65);
  Pessoa('Helena');
  Pessoa.mostrarPessoas();

  p1.peso = 70;
  p2.peso = 61.1;

  Pessoa.alterarDetalhes('Helena', idade: 5, peso: 20);
  Pessoa.mostrarPessoas();
}
