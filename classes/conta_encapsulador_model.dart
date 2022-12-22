import 'dart:math';

class Conta {
  bool alterarLimite = false;
  late int _numeroConta;
  String _nome;
  double _saldo = 0;
  double _limite = 500;
  Conta(this._nome) {
    this._numeroConta = Random().nextInt(1000);
    print('Conta nº:$_numeroConta, Titular: $_nome. Criada!');
  }

  Conta.vip(this._nome, {double limite = 1000}) {
    this._numeroConta = Random().nextInt(1000);
    this.alterarLimite = true;
    this._limite = limite;
    print('Conta vip nº:$_numeroConta, Titular: $_nome. Criada!');
  }

  int get numeroConta => _numeroConta;
  double get saldo => this._saldo;
  get informacao => 'Titular: $_nome, Conta nº: $_numeroConta, Saldo:$saldo';

  set limite(double limite) {
    if (alterarLimite) {
      this._limite = limite;
      print('Limite alterado para $_limite');
    } else {
      print('Permissão de alteração de limite negada!');
    }
  }

  set deposito(double deposito) {
    if (deposito > 0) {
      this._saldo += deposito;
      print('Deposito no valor de $deposito');
    }
  }

  set saque(double saque) {
    if (saque > 0 && saque <= _limite) {
      if (saque <= saldo) {
        this._saldo -= saque;
        print('Saque no valor de $saque, Saldo atual de: $_saldo');
      } else {
        print('Saque no valor de $saque, não realizado! Saldo insuficiente');
      }
    } else {
      print('Sque não realizado! Limite para saque é de :$_limite');
    }
  }
}
