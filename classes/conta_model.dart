import 'dart:math';

class Conta {
  String nome;
  int numConta = Random().nextInt(10000);
  double _saldo =
      0; // deixando com underline na frente, diz que essa propriedade é Privada
  Conta(this.nome);
  double consultaSaldo() => _saldo;
  double depositar(double deposito) {
    _saldo += deposito;
    return consultaSaldo();
  }

  double sacar(double saque) {
    _saldo -= saque;
    return consultaSaldo();
  }
}
