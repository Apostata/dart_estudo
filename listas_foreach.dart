// no dart um array é um List<{Tipo}>

import 'dart:math';

listForeach() {
  List<num> listNum = [0, 2.5, 5, 7.25, 10];
  List<int> listInt = [1, 5, 10];
  List<double> listDouble = [2.5, 7.5];
  List<bool> listBool = [true, false, !true, !false];
  List<String> listString = ['Morango', 'Banana', 'Tomate'];

  listNum.forEach((num) {
    print('\nforeach: $num');
  });
  print(
      '\nlistBool[3]: ${listBool[listInt.length] ? 'verdadeiro' : 'false'}\n');

  listString.insert(0, 'Abacaxi');
  listString.add('Laranja');

  listString.forEach((fruta) {
    print('foreach: $fruta');
  });

  listString.removeLast();
  listString.removeWhere((fruta) => fruta == 'Banana');
  print(listString);
  print(listString.elementAt(2));
  print(listString.contains('abacaxi')); // se fosse 'Abacaxi' seria true

  List<num> numeros = List.from(listInt)
    ..addAll(listDouble) // adiciona todos itens da lista passada
    ..shuffle() //embaralha a lista
    ..sort(); //ordena
  print(numeros);

  List<dynamic> listaDyn = List.filled(2, null, growable: false);
  listaDyn = numeros.take(3).skip(1).take(1).toList();
  // take: pega X elemetos da lista
  // skip: pula o elemento de indice (X+1) da lista
  print('Lista: $listaDyn');

  // geradores de lista
  List<String> listaStringPreenchida = List.filled(2, 'elemento');
  print('Lista string pré-preenchida: $listaStringPreenchida');

  List<String> listaGerada = List.generate(2, (idx) => 'Indice: $idx');
  print('listaGerada: $listaGerada');

  List<double> listPrecosRandom = List.generate(
      5,
      (idx) =>
          double.parse(((idx + 1) * Random().nextDouble()).toStringAsFixed(2)));
  print('listPrecosRandom: $listPrecosRandom');
}

void main(List<String> args) {
  listForeach();
}
