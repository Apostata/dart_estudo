/*
Meotods Override/sobreposição != overload/sobrecarga

classes abstratas não podem ser instanciadas e seus métodos devem ser sobrescritos nos herdeiros
*/

abstract class Animal {
  String idade;
  bool docil;
  late bool coluna;

  Animal.vertebrados(this.idade, {required this.docil}) {
    this.coluna = true;
  }

  Animal.invertebrados(this.idade, {required this.docil}) {
    this.coluna = false;
  }

  void dormir() {
    print('Dorme como um animal!');
  }
}

abstract class Mamiferos extends Animal {
  String sexo;
  late String desenvolvimento;

  Mamiferos.placentarios(this.sexo, String idade, {docil})
      : super.vertebrados(idade, docil: docil) {
    this.desenvolvimento = 'Placenta';
  }

  Mamiferos.marsupiais(this.sexo, String idade, {docil})
      : super.vertebrados(idade, docil: docil) {
    this.desenvolvimento = 'Planceta + bolsa externa';
  }

  Mamiferos.monotremados(this.sexo, String idade, {docil})
      : super.vertebrados(idade, docil: docil) {
    this.desenvolvimento = 'Ovo';
  }

  void alimentar() {
    print('se alimenta como um');
  }

  void reproduzir();
}

class Cao extends Mamiferos {
  String nome;
  String raca;

  Cao.domestico(this.nome, this.raca, String sexo,
      {String idade = 'indefinida', bool docil = true})
      : super.placentarios(sexo, idade, docil: docil);
  Cao.selvagem(this.nome, this.raca, String sexo,
      {String idade = 'indefinida', bool docil = false})
      : super.placentarios(sexo, idade, docil: docil);

  @override
  void dormir() {
    // super.dormir();
    print('dorme como um cão');
  }

  @override
  void alimentar() {
    super.alimentar();
    print('cão!');
  }

  @override
  void reproduzir() {
    print('se reproduz como um cão');
  }

  void late() {
    print('late como um cão');
  }

  // toda classe extende de objeto, ao usar função print a função toString retorno 'Instance of 'Object''
  @override
  String toString() {
    // return super.toString();
    return "Instance of '${this.runtimeType}' nome: ${nome}, raça:${raca}, sexo:${sexo}";
  }
}

void main(List<String> args) {
  Cao cao = Cao.domestico('Nina', 'Vira-lata', 'Fêmea');
  Cao warg = Cao.selvagem('zar', 'Warg', 'macho');
  print(
      'Nome: ${cao.nome}, Raça: ${cao.raca}, Sexo: ${cao.sexo}, Idade: ${cao.idade}, Docil:${cao.docil}');
  print('desenvolvimento: ${cao.desenvolvimento}, vertebrado: ${cao.coluna}');
  cao
    ..dormir()
    ..alimentar()
    ..reproduzir()
    ..late();

  print(cao.toString());

  print(
      'Nome: ${warg.nome}, Raça: ${warg.raca}, Sexo: ${warg.sexo}, Idade: ${warg.idade}, Docil:${warg.docil}');
  print('desenvolvimento: ${warg.desenvolvimento}, vertebrado: ${warg.coluna}');

  warg
    ..dormir()
    ..alimentar()
    ..reproduzir()
    ..late();

  print(warg.toString());
}
