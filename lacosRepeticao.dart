void main(List<String> args) {
  // laços

  int numero = 5;
  while (numero > 0) {
    print(numero);
    numero--;
  }

  int numero2 = 5;
  print('');

  do {
    print(numero2);
    numero2--;
  } while (numero2 > 0);

  print('');

  for (int num = 5; num > 0; num--) {
    print(num);
  }

  List<String> frutas = ['banana', 'maçã', 'abacaxi', 'limão'];
  for (String fruta in frutas) {
    print(fruta);
  }

  // breaks, continues e labels

  //Loop padrão
  for (int i = 0; i < 2; i++) {
    for (int j = i; j < 2; j++) {
      for (int k = j; k < 2; k++) {
        print('i:$i, j:$j, k:$k');
      }
    }
  }

  // loop com labels, breaks
  loopExterno:
  for (int i = 0; i < 3; i++) {
    print('loopExterno i:$i');
    loopInterno:
    for (int j = 0; j <= 3; j++) {
      print('loopInterno i:$i, j:$j');
      if (j > 2) break;
      if (i == 1) break loopInterno;
      if (i == 2) break loopExterno;
      print('loop completo');
    }
  }

  print('');

  // for com labels e continue
  loopExterno2:
  for (int i = 1; i <= 2; i++) {
    print('loopExterno2: i:$i');
    loopInterno2:
    for (int j = 1; j <= 3; j++) {
      print('loopInterno2 i:$i, j:$j');
      if (i == 1 && j == 1) continue loopInterno2;
      if (i == 2 && j == 2) continue loopExterno2;
      print('loop2 completo');
    }
  }
}
