void main(List<String> args) {
  Pessoa rene = Pessoa('Rene', ['Érica', 'Helena', 'Diana']);
  rene.nome = 'Rene Souza';
  // rene.familiares = []; erro pq ele é uma constante do 'Final' constante de tempo de execução
}

class Pessoa {
  String nome;
  final dynamic familiares;

  Pessoa(this.nome, this.familiares);
}
