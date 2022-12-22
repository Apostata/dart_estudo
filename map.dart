/*
Map é uma coleção dinâmica e customizável em que os valores não se repetem
*/

void linkedHashMap() {
  List<String> nomes = ['Rene', 'Erica'];
  Map<int, dynamic> nomesMap = nomes.asMap();

  print('map $nomesMap');

  nomesMap.forEach((key, value) {
    print('chave: $key, valor: $value');
  });

  Map<String?, dynamic> frutas = Map();
  frutas['banana'] = 'amarela';
  frutas['banana'] = 'verde';
  frutas['goiaba'] = 'amarela';
  frutas['maca'] = 'vermelha';
  print(frutas);
  print(frutas.containsKey('banana'));
  print(frutas.containsValue('vermelha'));
  frutas.clear();
  frutas[null] = null;
  print(frutas.containsValue('vermelha'));
  print(frutas);

  //funções expecíficas de map

  Map<String, dynamic> usuarios =
      Map.from({'nome': 'Rene', 'idade': 33, 'peso': 67});
  print(usuarios);

  usuarios.update('nome', (value) => '$value Souza');
  usuarios.update('idade', (value) => ++value);
  usuarios.update(
    'profissao',
    (value) => 'Programador',
    ifAbsent: () => 'Desempregado',
  );
  print(usuarios);

  usuarios.removeWhere((key, value) => key == 'profissao');
  usuarios.putIfAbsent('altura', () => '1.67');
  usuarios.addAll({'sexo': 'Masculino', 'casado': true});
  print(usuarios);

  print(
    'chaves: ${usuarios.keys}, valores: ${usuarios.values}, entries: ${usuarios.entries}',
  );

  Map<int, dynamic> numeros = {0: 'zero', 1: 'um', 2: 'dois'};
  print(numeros);
  print(
    numeros.map(
      (key, value) => MapEntry(key, '${(value.toString().toUpperCase())}'),
    ),
  );
  print(numeros);

  for (int key in numeros.keys) {
    print(key);
  }
  for (dynamic value in numeros.values) {
    print(value.toString());
  }
}

mapMap() {
  // map - transforma/seleciona os elementos de uma coleção criando uma nova do mesmo tamanho
  List<Map<String, dynamic>> carrinho = [
    {'nome': 'Borracha', 'preco': 3.45},
    {'nome': 'Caderno', 'preco': 13.9},
    {'nome': 'KitLapis', 'preco': 33.34},
    {'nome': 'Caneta', 'preco': 6.5}
  ];

  Function(Map) Function(double) porcentagem =
      (desconto) => (item) => desconto * item['preco'];

  final dynamic Function(dynamic) modeda = (e) =>
      'R\$ ${(e as double).toDouble().toStringAsFixed(2).replaceFirst('.', ',')}';

  List<String> precos1 =
      List<String>.from(carrinho.map(porcentagem(.9)).map(modeda));
  List<String> precos2 = List<String>.from(carrinho
      .map((item) => item.update('preco', (value) => value * .9))
      .map(modeda));
  String precoMedio = modeda(carrinho
          .map((item) => item['preco'])
          .reduce((anterior, atual) => atual + anterior) /
      carrinho.length);

  List<Map<String, dynamic>> escola = [
    {
      'nome': 'Turma T1',
      'alunos': [
        {'nome': 'Rene', 'nota': 7.3},
        {'nome': 'Erica', 'nota': 9.3}
      ],
    },
    {
      'nome': 'Turma T2',
      'alunos': [
        {'nome': 'Helena', 'nota': 8.9},
        {'nome': 'Diana', 'nota': 8.7}
      ],
    },
  ];

  List<dynamic> alunos = escola
      .map((truma) => truma['alunos'])
      .expand((element) => element)
      .toList();

  List<dynamic> notas = alunos
      .map(
        (e) => e['nota'],
      )
      .toList();

  double mediaNotas =
      notas.reduce((anterior, atual) => anterior + atual) / notas.length;

  print(precos1);
  print(precos2);
  print(precoMedio);
  print(alunos);
  print(notas);
  alunos.sort((a, b) => a['nota'].compareTo(b['nota']));
  print(alunos);
  alunos.sort((a, b) => b['nota'].compareTo(a['nota']));
  print(alunos);
  print(mediaNotas);
}

void main(List<String> args) {
  linkedHashMap();
  mapMap();
}
