/* Fold 
  - igual ao reduce mas pode-se passar um valor inicial

*/

void listFold() {
  List<int> numerosPares = List.generate(6, (idx) => idx * 2);

  var resultado = numerosPares.fold(0, (anterior, atual) => anterior + atual);
  var resultado2 = numerosPares.fold(10, (anterior, atual) => anterior + atual);
  print(resultado);
  print(resultado2);
}

void main(List<String> args) {
  listFold();
}
