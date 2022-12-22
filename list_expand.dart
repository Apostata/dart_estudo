// Cria uma nova lista expandindo ou concatenando elementos das lista especificadas no expand

import 'dart:ffi';

void listExpand() {
  List<List<int>> listaDeListaInt = [
    [1, 2],
    [3, 4]
  ];

  List<dynamic> listFlat =
      listaDeListaInt.expand((lista) => lista.toList()).toList();

  List<dynamic> listaDuplicada =
      listFlat.expand((elemento) => [elemento, elemento]).toList();

  List<num> listNum = [1, 2.5, 5, 7.25, 10];
  List<int> listInt = [1, 5, 10];
  List<double> listDouble = [2.5, 7.25];

  List<dynamic> listDyn = List.filled(1, null);

  print('listaFlat: $listFlat');
  print('listaDuplicada: $listaDuplicada');
  print('listDynamic: $listDyn');
  print(listDyn = [1, 5, 10] + [2, 7]); //concatenação
  print(listDyn = []
    ..addAll(listInt)
    ..addAll(listDouble));
  print(listDyn = [0, ...listInt, 15]);
  print(listDyn = [
    ...[],
    ...listInt,
    if (listDouble is List<double>) ...listDouble
  ]);
  print(listDyn = [
    ...['oples'],
    for (num numero in listNum) numero
  ]);
}

void main(List<String> args) {
  listExpand();
}
