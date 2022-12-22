class Pessoa {
  late String nome;
  late int idade;

  void info() {
    print('Nome:$nome, idade:$idade');
  }
}

class Person {
  String nome;
  int idade;
  double peso;
  double altura;
  Person(
    this.nome,
    this.idade, [
    this.peso = 60,
    this.altura = 1.65,
  ]);
}
