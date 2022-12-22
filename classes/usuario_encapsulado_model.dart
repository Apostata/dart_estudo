class Usuario {
  bool alteracao = false;
  String nome;
  String _senha;

  Usuario(this.nome, this._senha);

//  getter
  String get senha {
    return _senha;
  }

  // setter
  set senha(String senha) {
    if (alteracao) {
      _senha = senha;
      print('Senha alterada!');
    } else {
      print('Acesso negado!');
    }
  }
}
