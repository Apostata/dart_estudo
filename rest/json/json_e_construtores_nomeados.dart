import 'dart:convert';

///
/// * Serialização manual - 'dart:convert'
/// * Serialização direta
/// - perde recurso estático de linguagens
/// - segurança de tipo, autocomplete e exceções em tempo de compilação
///

String jsonString = '''
{
  "nome" : "Rene",
  "idade" : 34,
  "email": "rs@gmail.com"
}
''';

String jsonStringList = '''
[
  {
    "nome" : "Rene",
    "idade" : 34,
    "email": "rs@gmail.com"
  },
   {
    "nome" : "Erica",
    "idade" : 32,
    "email": "eg@gmail.com"
  }
]
''';

conversaoDireta() {
  print('\nconversão direta');
// DECODE
  Map<String, dynamic> parsedJson = jsonDecode(jsonString);
  print('parsedJson: $parsedJson');
  String nome = parsedJson['nome'];
  int idade = parsedJson['idade'];
  String email = parsedJson['email'];
  print('Serialização direta: nome:$nome, idade:$idade, email:$email');

//ENCODE
  Map<String, dynamic> map = {'nome': nome, 'idade': idade, 'email': email};
  String toJson = jsonEncode(map);
  print('encode: $map');
}

conversaoModelo() {
  print('\nconversão modelo');
  List<dynamic> parsedJson = jsonDecode(jsonStringList);
  print(parsedJson);
  //DECODE

  ListaUsuarios listaUsuarios = ListaUsuarios.fromJson(parsedJson);
  print(listaUsuarios);

  //ENCODE
  List<dynamic> lista = listaUsuarios.toJson();
  String toJson = jsonEncode(lista);
  print(toJson);
}

void main(List<String> args) {
  conversaoDireta();
  conversaoModelo();
}

// com construtor nomeado factory
class Usuario {
  final String nome;
  final int idade;
  final String email;

  //contrutor default
  const Usuario({required this.nome, required this.idade, required this.email});

  // construtor nomeado factory - retorna uma nova instancia do constutor default a partir de um map
  factory Usuario.fromJson(Map<String, dynamic> json) {
    return Usuario(
      nome: json['nome'],
      idade: json['idade'],
      email: json['email'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'nome': nome,
      'idade': idade,
      'email': email,
    };
  }
}

// com construtor nomeado simples
class Usuario2 {
  late String nome;
  late int idade;
  late String email;

  //contrutor default
  Usuario2({required this.nome, required this.idade, required this.email});

  // construtor nomeado simples - cria uma nova instancia a partir de um map
  Usuario2.fromJson(Map<String, dynamic> json) {
    this.nome = json['nome'];
    this.idade = json['idade'];
    this.email = json['email'];
  }

  Map<String, dynamic> toJson() {
    return {
      'nome': nome,
      'idade': idade,
      'email': email,
    };
  }
}

// com construtor nomeado com lista de inicialização, define parametros antes de executar o construtor
class Usuario3 {
  final String nome;
  final int idade;
  final String email;

  //contrutor default
  const Usuario3(
      {required this.nome, required this.idade, required this.email});

  // construtor nomeado com lista de inicialização
  Usuario3.fromJson(Map<String, dynamic> json)
      : nome = json['nome'],
        idade = json['idade'],
        email = json['email'] {
    //configurações inicias
  }

  Map<String, dynamic> toJson() {
    return {
      'nome': nome,
      'idade': idade,
      'email': email,
    };
  }
}

// com construtor nomeado de redirecionamento - não podem ter corpo nos construtor
class Usuario4 {
  final String nome;
  final int idade;
  final String email;

  //contrutor default
  const Usuario4(
      {required this.nome, required this.idade, required this.email});

  // construtor nomeado de redirecionamento, utiliza o this(...) para passar os parametros para o construtor default, não possui corpo de construtor
  Usuario4.fromJson(Map<String, dynamic> json)
      : this(nome: json['nome'], idade: json['idade'], email: json['email']);

  Map<String, dynamic> toJson() {
    return {
      'nome': nome,
      'idade': idade,
      'email': email,
    };
  }
}

/* 
Lista de usuários pode usar qualquer classe de usuário acima, que o resultado será o mesmo, 
era só para mostrar como funcionam os diferentes tipos de construtores
*/
class ListaUsuarios {
  List<Usuario> usuarios;

  //contrutor default
  ListaUsuarios({required this.usuarios});

  // construtor nomeado - todo construtor factory retorna algo
  factory ListaUsuarios.fromJson(List<dynamic> json) {
    return ListaUsuarios(
      usuarios: json.map((e) => Usuario.fromJson(e)).toList(),
    );
  }

  List<dynamic> toJson() {
    return usuarios;
  }

  @override
  String toString() {
    return 'instance of ListaUsuarios: { usuarios: ${usuarios.map((e) => e.toJson())}}';
  }
}
