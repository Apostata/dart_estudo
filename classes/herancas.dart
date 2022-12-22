// uma classe herda somente de uma classe

class Animal {
  late String idade;
  bool docil;
  Animal(String? idade, {required this.docil});

  void dormir() {
    print('Dorme como um animal!');
  }
}

class Mamiferos extends Animal {
  String sexo;

  Mamiferos(this.sexo, idade, docil) : super(idade, docil: docil);
  void alimentar() {
    print('Se alimenta como um mamifero');
  }
}

class Cao extends Mamiferos {
  String nome;
  String raca;
  Cao(this.nome, this.raca, String sexo,
      {String idade = 'indefinida', bool docil = true})
      : super(sexo, idade, docil) {
    this.idade = idade;
    this.docil = docil;
  }
  void acao() {
    print('late como um Cão');
  }
}

void main(List<String> args) {
  Cao cao = Cao('Nina', 'Vira-lata', 'Fêmea');
  print(
      'Nome: ${cao.nome}, raça: ${cao.raca}, idade: ${cao.idade}, docil: ${cao.docil}');
  cao
    ..dormir()
    ..alimentar()
    ..acao();
}
