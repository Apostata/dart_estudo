/* Reduce 
  - Compara os elmentos e retonra um unico elemente resultante atravez de um acumulador

*/

void listReduce() {
  List<int> numerosPares = List.generate(6, (idx) => idx * 2);
  List<bool> boleana = [true, false, !true, !false];
  List<int> idades = [36, 12, 18, 31, 17, 23];

  int resultado = numerosPares.reduce((anterior, atual) => anterior + atual);
  bool resultado2 = boleana.reduce((anterior, atual) => anterior && atual);
  bool resultado3 = boleana.reduce((anterior, atual) => anterior || atual);
  int maisNovo =
      idades.reduce((anterior, atual) => (anterior > atual) ? atual : anterior);
  int maisVelho =
      idades.reduce((anterior, atual) => (anterior < atual) ? atual : anterior);
  String media =
      (idades.reduce((anterior, atual) => anterior + atual) / idades.length)
          .toStringAsFixed(1);

  print(resultado);
  print(resultado2);
  print(resultado3);
  print(maisNovo);
  print(maisVelho);
  print(media);
}

void main(List<String> args) {
  listReduce();
}
