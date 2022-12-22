void main(List<String> args) {
  var textos = ['Rene', 'Diana'];
  var dinamicos = ['Rene', 1, 1.5, null, true];
  List<int> listaInt = [1, 3, 4, 7, 8];
  List<double> listaDouble = [10.2, 4.5, 7.8, 2.6, 4.1];
  List<num> listaNum = [10, 4.8, 7, 2.6, 4.1, 9];
  listaInt.add(9); // adiciona ao final da lista
  listaInt.insert(1, 2); //adiciona na posição 1, o item 2
  listaInt.removeAt(6); // remove item da posição 4
  listaInt.removeRange(4, 6); // remove items da posição 4 até a 6
  dinamicos.remove(null); // remove a primeira ocorrencia de 'null' na lista
  textos.clear(); // limpa a lista
  listaDouble.sort(); // ordena a lista em ordem crescente
  // dinamicos.sort(); // Erro não compara tipos diferentes como string e int
  listaNum.sort(); // porém compara int é double
  final newListInt = [...listaInt];
  final anotherNewListInt = [...listaInt];
  newListInt.sort((a, b) => b.compareTo(a)); // ordena em ordem decrescente
  ;
  print(listaInt);
  print(dinamicos);
  print(dinamicos.length);
  print(dinamicos.first);
  print(dinamicos.last);
  print(textos);
  print(textos.isEmpty);
  print(dinamicos.contains(1.5));
  print(listaDouble);
  print(listaNum);
  print(newListInt);
  print(anotherNewListInt.reversed.toList());
}
