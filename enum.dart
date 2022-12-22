enum Status { indefinido, rodando, parado, pausado }

enum Time { hour, day, week, month, year }

String timeToString(Time time) {
  switch (time) {
    case Time.hour:
      return '1h';
    case Time.week:
      return '1d';
    case Time.month:
      return '1m';
    case Time.year:
      return '1y';
    default:
      return '1h';
  }
}

void main(List<String> args) {
  print('lenght: ${Status.values.length}, valures: ${Status.values}');
  print('Acessando o index: ${Status.rodando}, ${Status.rodando.index}');

  print('\nfor');
  for (var i = 0; i < Status.values.length; i++) {
    print('indice: $i, valor: ${Status.values[i]}');
  }

  print('\nfor in');
  for (var valor in Status.values) {
    print('indice: ${valor.index}, value: $valor');
  }

  print('\nforeach');
  Status.values.forEach((item) {
    print('indice:${item.index}, valor: ${item}');
  });
}
