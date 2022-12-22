import 'classes/conta_encapsulador_model.dart';
import 'classes/usuario_encapsulado_model.dart';

void main(List<String> args) {
  Usuario usuario = Usuario('Rene', '123');
  print(usuario.senha);
  usuario
    ..senha = '123456' //acesso negado
    ..alteracao = true
    ..senha = '123456'; // sucesso
  print(usuario.senha);

  Conta conta = Conta('Rene');

  conta
    ..deposito = 900
    ..deposito = 450
    ..saque = 550
    ..saque = 500;

  print('');

  conta
    ..limite = 700
    ..alterarLimite = true
    ..limite = 1000
    ..alterarLimite = false;

  print('');

  conta
    ..saque = 950
    ..saque = 850;

  print(conta.informacao);

  Conta conta2 = Conta.vip('Erica', limite: 12500);
  conta2
    ..deposito = 15000
    ..saque = 15000
    ..limite = 15000
    ..saque = 15000;
  print(conta2.informacao);
}
