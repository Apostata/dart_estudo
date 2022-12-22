void mapWhere() {
  List<Map<dynamic, dynamic>> produtos = [
    {'nome': 'Notebook', 'preco': 2499, 'fragil': true},
    {'nome': 'Ipad', 'preco': 4199, 'fragil': true},
    {'nome': 'Iphone', 'preco': 2299, 'fragil': true},
    {'nome': 'Magic Mouse', 'preco': 299, 'fragil': false},
  ];

  bool Function(Map) eFragil = (produto) => produto['fragil'] == true;
  String Function(Map) nome = (produto) => produto['nome'];
  int Function(Map) idade = (pessoa) => pessoa['idade'];
  List<String> frageis = produtos.where(eFragil).map(nome).toList();
  print(frageis);

  List<Map<String, dynamic>> pessoas = [
    {'nome': 'Rene', 'idade': 47},
    {'nome': 'Erica', 'idade': 34},
    {'nome': 'Helena', 'idade': 17},
  ];
  List<Map<String, dynamic>> maiores =
      pessoas.where((pessoa) => pessoa['idade'] > 17).toList();

  print(maiores);

  double mediaIdade =
      pessoas.map(idade).reduce((anteriror, atual) => anteriror + atual) /
          pessoas.length;

  print(mediaIdade);
}

void main(List<String> args) {
  mapWhere();
}
