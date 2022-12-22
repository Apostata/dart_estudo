void main(List<String> args) {
  DateTime tempo = DateTime.now();
  String hora =
      '${tempo.hour}:${tempo.minute}:${tempo.second}:${tempo.millisecond}:${tempo.microsecond}';
  print(hora);

  Pessoa rene = Pessoa('Rene', 4, 8, 1984, horas: 11, minutos: 34);
}

class Pessoa {
  String nome;
  DateTime _agora = DateTime.now();
  late DateTime _data, _nascimento;

  Pessoa(this.nome, int diaNasc, int mesNasc, int anoNasc,
      {int horas = 0, int minutos = 0}) {
    this._nascimento = DateTime.utc(anoNasc, mesNasc, diaNasc, horas, minutos);
    print(
        '$nome, nasceu em $diaNasc/$mesNasc/$anoNasc ano ${bissexto(anoNasc)} ${diaSemana(_nascimento.weekday)} as $horas:$minutos');
    fecundacao();
    dados();
  }

  fecundacao() {
    int gestacaoMedia = 268;
    _data = _nascimento.subtract(Duration(days: gestacaoMedia));
    print(
        'data estimada da fecundação ${_data.day}/${_data.month}/${_data.year} ${diaSemana(_nascimento.weekday)}');
  }

  String bissexto(int ano) {
    if (ano % 4 == 0 || ano % 400 == 0 && ano % 100 != 0) {
      return 'bissexto';
    }
    return 'não bissexto';
  }

  int idade() => (_agora.difference(_nascimento).inDays / 360).floor();

  String diaSemana(int dia) {
    var diasDasemana = {
      1: 'Segunda-feira',
      2: 'Terça-feira',
      3: 'Quarta-feira',
      4: 'Quinta-feira',
      5: 'Sexta-feira',
      6: 'Sábado',
      7: 'Domingo',
    };
    return diasDasemana[dia]!;
  }

  dados() {
    print('''
    $nome, tem ${idade()} anos e está vivo a:
    ${_agora.difference(_nascimento).inDays} dias,
    ${_agora.difference(_nascimento).inHours} horas,
    ${_agora.difference(_nascimento).inMinutes}, minutos,
    ${_agora.difference(_nascimento).inSeconds}, segundos
''');
  }
}
