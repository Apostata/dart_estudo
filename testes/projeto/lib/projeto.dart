int calculate() {
  return 6 * 7;
}

List<String> converterEmLista(String texto) {
  return texto.split(' ');
}

String maioridade(int idade) {
  // try {
  if (idade < 0) {
    throw ArgumentError('Idade precisa se maior ou igual a 0');
  } else {
    if (idade > 17) {
      return 'Adulto';
    } else if (idade > 13) {
      return 'Adolescente';
    } else if (idade > 3) {
      return 'Criança';
    } else {
      return 'Bebê';
    }
  }
  // }
  // catch (e) {
  //   print(e);
  //   return null;
  // }
}
