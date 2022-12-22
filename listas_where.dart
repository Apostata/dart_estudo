// Testa se a condição passada satisfaz todos os elementos da lista

void listWhere() {
  List<num> listinteiros = [0, 1.5, 2, 3.4, 4, 5.7];
  List<int> idades = [36, 12, 18, 17, 23];

  List<int> resultado =
      List<int>.from(listinteiros.where((numero) => numero is int));

  List<double> resultado2 =
      List<double>.from(listinteiros.where((numero) => numero is double));

  List<int> adultos = idades.where((idade) => idade > 17).toList();
  int criancas = idades.singleWhere((idade) => idade < 12, orElse: () => 0);
  int menor = idades.lastWhere((idade) => idade.toString().startsWith('1'));
  int meiaIdade = idades.lastWhere((idade) => idade.toString().startsWith('4'),
      orElse: () => 0);
  print(resultado);
  print(resultado2);
  print(adultos);
  print(criancas);
  print(menor);
  print(meiaIdade > 0 ? meiaIdade : null);
}

void main(List<String> args) {
  listWhere();
}
