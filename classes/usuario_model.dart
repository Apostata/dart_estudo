class Usuario {
  late String usuario;
  late String senha;
  void autenticar(String user, String pass) {
    if (usuario == user && pass == senha) {
      print('Usuário autenticado');
    } else {
      print('Usuário não autenticado');
    }
  }
}

class User {
  String user, senha, nome;
  late String cargo;
  User(this.user, this.senha, [this.nome = 'usuário', this.cargo = 'default']);
  User.Admin(this.user, this.senha, [this.nome = 'admin']) {
    this.cargo = 'admin';
  }
}
