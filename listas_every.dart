// Testa se a condição passada satisfaz todos os elementos da lista

void listEvery() {
  List<int> listinteiros = [0, 1, 2, 3, 4, 5];
  List<String> listStrings = ['Rene', 'Erica', 'Helena', 'Diana'];

  bool resultado = listinteiros.every((inteiro) => inteiro >= 0);
  print(resultado);

  resultado = listStrings.every((pessoa) => pessoa.toLowerCase().contains('e'));
  print(resultado);
}

void main(List<String> args) {
  listEvery();
}
