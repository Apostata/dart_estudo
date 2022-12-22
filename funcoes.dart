// funções normais

void semRetorno() {
  print('função sem retorno');

  void closure() {
    print('função closure se retorno');
  }

  void soma(int a, int b) {
    int res = a + b;
    print('soma: $a + $b = $res');
  }

  closure();
  soma(2, 3);
}

String comRetorno() {
  String closure() {
    return 'função closure com retorno';
  }

  int soma(int a, int b) {
    return a + b;
  }

  print(soma(4, 6));

  return closure();
}

// funções arrow
String funcaoArrow() => 'funcao arrow string';

int somaArrow(int a, int b) => a + b;

// parametros posicionais, nomeados, e default

void exibirDados(String nome, int peso, double altura) {
  print('nome:$nome, peso:$peso, altura:$altura');
}

//função parametros default
void exibirDados2(String nome, [int peso = 60, double altura = 1.78]) {
  print('params default, nome:$nome, peso:$peso, altura:$altura');
}

// função parametros nomeados
void exibirDados3({required String nome, int peso = 43, double altura: 1.86}) {
  print('params nomeados, nome:$nome, peso:$peso, altura:$altura');
}

void exibirDados4(String nome, {required int peso, double altura: 1.86}) {
  print('params posicional e nomeado, nome:$nome, peso:$peso, altura:$altura');
}

void falar(String fala) {
  print(fala);
}

void acoes({required String nome, Function? callback}) {
  if (callback != null) {
    callback('Opa! uma ação');
  } else {
    print('sem ações');
  }
}

// funções anonimas
final void Function() funcaoAnonima = () => print('função anonima');

final void Function(String) funcaoAnonimaParams = (texto) => print(texto);
final funcaoAnonimaParams2 = (texto) => print(texto);

final String Function(String) funcaoAnonimaParamsReturn = (texto) => texto;

final dynamic Function(dynamic Function) funcaoAnonimaParamsFunc2 =
    (func) => func();

final void Function(dynamic Function()) executaFunc = (func) {
  func();
};

// closures
final void Function(String) saudacao = (String nome) {
  final void Function(String) message =
      (String complemento) => print('Olá $nome $complemento');
  message('bem vindo');
};

final Function(String) Function(String) saudacao2 = (String nome) {
  final void Function(String) message =
      (String complemento) => print('Olá $nome $complemento');
  return message;
};

final String Function(String nome, dynamic descricao) Function() criaObjeto =
    () {
  int id = 0;
  final String Function(String nome, dynamic descricao) objetoCriado = (nome,
          descricao) =>
      'id: ${(++id).toString().padLeft(2, '0')} nome:$nome, desc:$descricao';
  return objetoCriado;
};

final Map<String, dynamic> Function(String nome, dynamic descricao) Function()
    criaObjeto2 = () {
  int id = 0;
  final Map<String, dynamic> Function(String nome, dynamic descricao)
      objetoCriado = (nome, descricao) => {
            "id": (++id).toString().padLeft(2, '0'),
            "nome": nome,
            "desc": descricao,
          };
  return objetoCriado;
};

final IObjeto Function(String nome, dynamic descricao) Function() criaObjeto3 =
    () {
  int id = 0;
  final IObjeto Function(String nome, dynamic descricao) objetoCriado =
      (nome, descricao) => IObjeto.fromMap({
            "id": (++id).toString().padLeft(2, '0'),
            "nome": nome,
            "descricao": descricao,
          });
  return objetoCriado;
};

void main(List<String> args) {
  semRetorno();
  print(comRetorno());
  print(funcaoArrow());
  print(somaArrow(3, 8));
  exibirDados('Rene', 56, 1.78);
  exibirDados2('Rene');
  exibirDados3(altura: 1.78, nome: 'Rene', peso: 88);
  exibirDados4('Rene', peso: 66);
  acoes(nome: 'Rene');
  acoes(nome: 'Rene', callback: (String texto) => falar(texto));
  funcaoAnonima();
  funcaoAnonimaParams('função anonima com param');
  print(funcaoAnonimaParamsReturn(
      funcaoAnonimaParamsReturn('tetes retorno string')));
  executaFunc(() => funcaoAnonimaParams('teste'));
  print(saudacao);
  saudacao('Rene');
  saudacao2('Rene')('topzeira?');
  var objeto = criaObjeto();
  var objeto2 = criaObjeto2();
  var objeto3 = criaObjeto3();

  List<String> listObjetos = [objeto('Rene', 1.99), objeto('Erica', 2.99)];
  List<Map<String, dynamic>> listObjetos2 = [
    objeto2('Rene', 1.99),
    objeto2('Erica', 2.99)
  ];

  List<IObjeto> listObjetos3 = [objeto3('Rene', 1.99), objeto3('Erica', 2.99)];

  // List<String> listObjetos2 = [
  //   criaObjeto()('Helena', 'desc3'),
  //   criaObjeto()('Diana', 'desc4')
  // ]; // não incrementa o id pois a função criarObjeto é chamada com id zero todas as vezes.
  for (String obj in listObjetos) {
    print(obj.substring(7));
  }
  for (Map<String, dynamic> obj2 in listObjetos2) {
    print(obj2.map(
        (key, value) => MapEntry(key, value is double ? 'R\$$value' : value)));
  }
  for (IObjeto obj3 in listObjetos3) {
    print('${obj3.id} ${obj3.nome} ${obj3.descricao}');

//   for (String obj in listObjetos2) {
//     print(obj);
//   }
  }
}

class IObjeto {
  String id, nome;
  dynamic descricao;
  IObjeto({
    required this.id,
    required this.nome,
    this.descricao,
  });
  factory IObjeto.fromMap(Map<String, dynamic> map) {
    return IObjeto(
      id: map['id'].toString(),
      nome: map['nome'],
      descricao: map['descricao'],
    );
  }
}
