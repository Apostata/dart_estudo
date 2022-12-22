/*
set - é uma coleção de elementos únicos e ordenados
hashSet - é uma coleção de elementos únicos e desordenados
splayTreeSet - organiza automáticamente elementos em ordem crescente, não pode conter elementos null
 */

import 'dart:collection';

void linkedHashSet() {
  Set<int?> setInt = Set();
  setInt.add(1);
  setInt.add(14);
  setInt.add(null);
  setInt.add(17);
  setInt.add(17); //não vai adicionar pois já existe
  setInt.remove(17);
  print(setInt);

  for (int idx = 0; idx < setInt.length; idx++) {
    //não tem indicie direto pois
    print('for: ${setInt.elementAt(idx)}');
  }

  for (var element in setInt) {
    print('for in: $element');
  }

  setInt.forEach((element) {
    print('foreach: $element');
  });

  // funçoes de set
  Set<int> listaA = {0, 1, 2, 3, 4};
  Set<int> listaB = {3, 4, 5, 6, 7};

  print(listaA.difference(listaB)); // diferença entre ListaA e ListaB
  print(listaA.union(listaB)); // união entre ListaA e ListaB
  print(listaA
      .intersection(listaB)); // intersecção(items comuns) entre ListaA e ListaB
  print(listaA
      .lookup(0)); // ve se tem o elemento na lista, caso contrario retorna null
  print(listaA.lookup(5));
}

void hashSet() {
  HashSet<String?> hashSet1 = HashSet();
  HashSet<int> hashSet2 = HashSet();
  HashSet<int> hashSet3 = HashSet();

  hashSet1.add('A');
  hashSet1.add('B');
  hashSet1.add('C');
  hashSet1.add('D');
  hashSet1.add(null);
  print(hashSet1);

  hashSet2.add(1); // apenas int com 1 decimal fica ordenada
  hashSet2.add(2); // apenas int com 1 decimal fica ordenada
  hashSet2.add(3); // apenas int com 1 decimal fica ordenada
  print(hashSet2);

  hashSet3.add(11);
  hashSet3.add(22);
  hashSet3.add(33);
  print(hashSet3);

  for (int idx = 0; idx < hashSet1.length; idx++) {
    print('for: ${hashSet1.elementAt(idx)}');
  }

  for (var element in hashSet2) {
    print('for in: $element');
  }

  hashSet3.forEach((element) {
    print('foreach: $element');
  });
}

void splayTreeSet() {
  SplayTreeSet<String?> splayTreeSet = SplayTreeSet();
  splayTreeSet.add('info1');
  splayTreeSet.add('info3');
  splayTreeSet.add('info');
  splayTreeSet.add('info2');
  //splayTreeSet.add(null); // não adiciona, mesmo o tipo de splayTreeSert sendo String?
  print(splayTreeSet);

  for (int idx = 0; idx < splayTreeSet.length; idx++) {
    print('for: ${splayTreeSet.elementAt(idx)}');
  }

  for (var element in splayTreeSet) {
    print('for in: $element');
  }

  splayTreeSet.forEach((element) {
    print('foreach: $element');
  });
}

void main(List<String> args) {
  linkedHashSet();
  hashSet();
  splayTreeSet();
}
