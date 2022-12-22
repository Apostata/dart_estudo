import 'classes/conta_model.dart';
import 'classes/pessoa_model.dart';
import 'classes/usuario_model.dart';

void main(List<String> args) {
  Pessoa rene = Pessoa();
  rene.nome = 'Rene';
  rene.idade = 33;
  rene.info();

  Usuario user = Usuario();
  user.usuario = 'rene';
  user.senha = 'segredo';
  user.autenticar('teste', '1235');
  user.autenticar('rene', 'segredo');

  Conta conta = Conta('Rene');
  print(conta.consultaSaldo());
  print(conta.depositar(123.97));
  print(conta.depositar(123.97));
  print(conta.sacar(23.54));

// Operador cascata '..', simplifica repetição

  Pessoa pessoa = Pessoa();
  pessoa
    ..nome = 'Teste'
    ..idade = 34;
  print(pessoa.nome);
}
