// Testa se a condição passada satisfaz todos os elementos do map

void mapEvery() {
  List<Map<String, dynamic>> pessoas = [
    {'nome': 'Hene', 'idade': 60},
    {'nome': 'Herica', 'idade': 31},
    {'nome': 'Helena', 'idade': 17}
  ];

  print(pessoas.every((pessoa) => pessoa.containsKey('nome')));
  print(pessoas.every((pessoa) => pessoa['idade'] == 17));
  print(pessoas.every((pessoa) => (pessoa['nome'] as String).startsWith('H')));
}

void main(List<String> args) {
  mapEvery();
}
